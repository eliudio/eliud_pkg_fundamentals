import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_component.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';
import 'package:flutter/material.dart';

class DecoratedContentComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, Object>? parameters}) {
    return DecoratedContentComponent(decoratedContentID: id);
  }
}

class DecoratedContentComponent extends AbstractDecoratedContentComponent {
  DecoratedContentComponent({String? decoratedContentID})
      : super(decoratedContentID: decoratedContentID);

  @override
  Widget yourWidget(BuildContext context, DecoratedContentModel? value) {
    var contents = Registry.registry()!.component(
        value!.contentComponentName!,
        value.contentComponentId!);
    var image = Registry.registry()!.component(
        value.decoratingComponentName!,
        value.decoratingComponentId!);
    var percentageImageVisible = value.percentageDecorationVisible == null
        ? .5
        : value.percentageDecorationVisible;

    // calculate the size of the image horizontally
    var app = AccessBloc.app(context);
    var ratio = screenRatio(context);

    // When the ration of the screen is such that the decoration can not fit niceless on the side, then we might drop it, or we might put it above or below, depending on config
    if (ratio < 1) {
      var isDrop = (value.decorationComponentPosition ==
              DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseDrop) ||
          (value.decorationComponentPosition ==
              DecorationComponentPosition.RightIfSpaceAvailableOtherwiseDrop);
      if (isDrop) {
        return contents;
      } else {
        var children;
        var isTop = (value.decorationComponentPosition ==
                DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseTop) ||
            (value.decorationComponentPosition ==
                DecorationComponentPosition.RightIfSpaceAvailableOtherwiseTop);
        if (isTop) {
          children = [
            image,
            contents,
          ];
        } else {
          children = [
            contents,
            image,
          ];
        }
        return ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: children,
        );
      }
    } else {
      var fraction1 = Expanded(
        flex: (10 * percentageImageVisible!).toInt(),
        child: Container(),
      );
      var fraction2 = Expanded(
          flex: (10 - (10 * percentageImageVisible)).toInt(), child: contents);
      var isLeft = value.decorationComponentPosition ==
              DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseTop ||
          value.decorationComponentPosition ==
              DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseBottom;
      var row;
      if (isLeft) {
        row = Row(children: [fraction1, fraction2]);
      } else {
        row = Row(children: [fraction2, fraction1]);
      }
      return Stack(children: [
        Align(
          alignment: isLeft ? Alignment.topLeft : Alignment.topRight,
          child: image,
        ),
        row
      ]);
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  DecoratedContentRepository getDecoratedContentRepository(
      BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .decoratedContentRepository(AccessBloc.appId(context))!;
  }
}
