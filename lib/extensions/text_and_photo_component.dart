import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';

class BookletComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return BookletComponent(bookletID: id);
  }
}

class BookletComponent extends AbstractBookletComponent {
  BookletComponent({String? bookletID}) : super(bookletID: bookletID);

  @override
  Widget yourWidget(BuildContext context, BookletModel? value) {
    // part of the new component
    bool isLeft = false;
    var title = "Title";
    var contents = "sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj \nasdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd sdaosad loadksj asdkjasd ";
    var textAlign = TextAlign.center;

    var app = AccessBloc.app(context)!;
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
        style: FontTools.textStyle(app.h5),
        textAlign: textAlign,
      )
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

      return Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: isLeft ? Alignment.topLeft : Alignment.topRight,
                  child: Image.network(value!.sections![0].image!.url!),
                )),
            row
          ]));
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  BookletRepository getBookletRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .bookletRepository(AccessBloc.appId(context))!;
  }
}
