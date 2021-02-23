import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_component.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';
import 'package:flutter/material.dart';

class PhotoAndTextComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
    return PhotoAndTextComponent(photoAndTextID: id);
  }
}

class PhotoAndTextComponent extends AbstractPhotoAndTextComponent {
  PhotoAndTextComponent({String photoAndTextID}) : super(photoAndTextID: photoAndTextID);

  @override
  Widget yourWidget(BuildContext context, PhotoAndTextModel value) {
    var title = value.title;
    var contents = value.contents;
    var textAlign = TextAlign.center;
    var image = value.image.url;
    var percentageImageVisible = value.percentageImageVisible == null ? .5 : value.percentageImageVisible;

    // calculate the size of the image horizontally
    var width = value.image.mediumHeight / (value.image.mediumWidth * percentageImageVisible);

    var app = AccessBloc.app(context);
    var ratio = screenRatio(context);
    var text = ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Text(title,
              textAlign: textAlign,
              style: FontTools.textStyle(app.h1)),
          Container(height: 20),
          Text(contents,
            style: FontTools.textStyle(app.fontText),
            textAlign: textAlign,
          )
        ]);

    if (ratio < 1) {
      var isDrop = (value.imagePosition == PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseDrop) ||
          (value.imagePosition == PhotoAndTextImagePosition.RightIfSpaceAvailableOtherwiseDrop);
      if (isDrop) {
        return Image.network(image);
      } else {
        var children;
        var isTop = (value.imagePosition ==
            PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseTop) ||
            (value.imagePosition ==
                PhotoAndTextImagePosition.RightIfSpaceAvailableOtherwiseTop);
        if (isTop) {
          children = [
            Image.network(image),
            text,
          ];
        } else {
          children = [
            text,
            Image.network(image),
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
        flex: (10 - (10 * percentageImageVisible)).toInt(),
        child: text);
      var isLeft = value.imagePosition == PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseTop || value.imagePosition == PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseBottom;
      var row;
      if (isLeft) {
        row = Row(children: [
          fraction1,
          fraction2
        ]);
      } else {
        row = Row(children: [
          fraction2,
          fraction1
        ]);
      }

/*
      return Stack(children: [
            Image.network(image, alignment: isLeft ? Alignment.topLeft : Alignment.topRight),
            row
          ]);
*/
      return Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.network(image),
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
  PhotoAndTextRepository getPhotoAndTextRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .photoAndTextRepository(AccessBloc.appId(context));
  }
}
