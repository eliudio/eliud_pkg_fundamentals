import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_component.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';

class PlayStoreComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return PlayStoreBase(id);
  }
}

class PlayStoreBase extends AbstractPlayStoreComponent {
  final String id;

  PlayStoreBase(this.id) : super(playStoreID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PlayStoreRepository getPlayStoreRepository() {
    return AbstractRepositorySingleton.singleton.playStoreRepository();
  }

  @override
  Widget yourWidget(BuildContext context, PlayStoreModel value) {
    return PlayStore(value);
  }
}

class PlayStore extends StatefulWidget {
  final PlayStoreModel playStoreModel;

  PlayStore(this.playStoreModel);

  @override
  State<StatefulWidget> createState() {
    return PlayStoreState();
  }
}

class PlayStoreState extends State<PlayStore> {
  PlayStoreState();

  Widget _buildStack(double size, Widget image, String name) => Container(
    height: size,
    width: size,
    child: image,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppModel>>(
      future:  AbstractMainRepositorySingleton.singleton.appRepository().valuesList(),
      builder: (BuildContext context, AsyncSnapshot<List<AppModel>> snapshot) {
        if (snapshot.hasData) {
          return _build(context, snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _build(BuildContext context, List<AppModel> apps) {
    double size = 150;
    List<Widget> components = List();
    apps.forEach((model) {
      if (model.documentID != GlobalData.playStoreApp) {
        List<Widget> children = List();
        children.add(new GestureDetector(
            onTap: () async {
              EliudRouter.Router.navigateTo(context, SwitchApp(appID: model.documentID));
            },
            child: _buildStack(
                size - 40,
                ImageHelper.getImageFromURL(url: model.logoURL),
                model.title)));
        components.add(Column(children: children));
      }
    });

    int count = (fullScreenWidth(context) / size).floor() + 1;
    int rows = ((components.length -1) / count).floor() + 1;
    double fullHeight = rows * size;
    // end tests

    if (components.length > 0) {
      return Container(
          height: fullHeight,
          child: GridView.extent(maxCrossAxisExtent: size,
              padding: const EdgeInsets.all(0),
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              physics: ScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              children: components));
    } else {
      return Text("No apps available");
    }
  }
}
