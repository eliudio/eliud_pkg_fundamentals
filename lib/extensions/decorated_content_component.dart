import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/decorated_content_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/decorated_content_model.dart';
import 'package:flutter/material.dart';

class DecoratedContentComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return DecoratedContentComponent(
        key: key, app: app, decoratedContentId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await decoratedContentRepository(appId: app.documentID)!.get(id);
}

class DecoratedContentComponent extends AbstractDecoratedContentComponent {
  DecoratedContentComponent(
      {super.key, required super.app, required super.decoratedContentId});

  @override
  Widget yourWidget(BuildContext context, DecoratedContentModel? value) {
    var contents = Apis.apis().component(
        context, app, value!.contentComponentName!, value.contentComponentId!);
    var image = Apis.apis().component(context, app,
        value.decoratingComponentName!, value.decoratingComponentId!);
    var percentageImageVisible = value.percentageDecorationVisible ?? .5;

    // calculate the size of the image horizontally
    var ratio = screenRatio(context);

    // When the ration of the screen is such that the decoration can not fit niceless on the side, then we might drop it, or we might put it above or below, depending on config
    if (ratio < 1) {
      var isDrop = (value.decorationComponentPosition ==
              DecorationComponentPosition.leftIfSpaceAvailableOtherwiseDrop) ||
          (value.decorationComponentPosition ==
              DecorationComponentPosition.rightIfSpaceAvailableOtherwiseDrop);
      if (isDrop) {
        return contents;
      } else {
        List<Widget> children;
        var isTop = (value.decorationComponentPosition ==
                DecorationComponentPosition.leftIfSpaceAvailableOtherwiseTop) ||
            (value.decorationComponentPosition ==
                DecorationComponentPosition.rightIfSpaceAvailableOtherwiseTop);
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
        flex: (10 * percentageImageVisible).toInt(),
        child: Container(),
      );
      var fraction2 = Expanded(
          flex: (10 - (10 * percentageImageVisible)).toInt(), child: contents);
      var isLeft = value.decorationComponentPosition ==
              DecorationComponentPosition.leftIfSpaceAvailableOtherwiseTop ||
          value.decorationComponentPosition ==
              DecorationComponentPosition.leftIfSpaceAvailableOtherwiseBottom;
      Row row;
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
}
