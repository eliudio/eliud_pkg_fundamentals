import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_model.dart';
import 'package:flutter/material.dart';

class BookletComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return BookletComponent(key: key, app: app, bookletId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await bookletRepository(appId: app.documentID)!.get(id);
}

class BookletComponent extends AbstractBookletComponent {
  BookletComponent({super.key, required super.app, required super.bookletId});

  @override
  Widget yourWidget(BuildContext context, BookletModel? value) {
    // part of the new component
    //bool isLeft = false;
    var title = "Title";
    var contents =
        "sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj \nasdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd ";
    var textAlign = TextAlign.center;

    var ratio = screenRatio(context);
    var text = ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      h1(
        app,
        context,
        title,
        textAlign: textAlign,
      ),
      Container(height: 20),
      h5(
        app,
        context,
        contents,
        textAlign: textAlign,
      ),
    ]);

    if (ratio < 1) {
      return ListView(
        children: [
          Image.network(value!.sections![0].image!.url!),
          text,
        ],
      );
    } else {
      var fraction1 = Flexible(
          child: FractionallySizedBox(
        widthFactor: 1,
      ));
      var fraction2 = Flexible(
          child: FractionallySizedBox(
              alignment: Alignment.bottomRight,
              heightFactor: 1,
              widthFactor: 1,
              child: text));

      Row row;
/*
      if (isLeft) {
        row = Row(children: [fraction1, fraction2]);
      } else {
*/
      row = Row(children: [fraction2, fraction1]);
//      }

      return Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: /*isLeft ? Alignment.topLeft : */
                      Alignment.topRight,
                  child: Image.network(value!.sections![0].image!.url!),
                )),
            row
          ]));
    }
  }
}
