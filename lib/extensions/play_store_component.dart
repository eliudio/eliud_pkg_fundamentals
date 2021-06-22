import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_component.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';
import 'package:flutter/material.dart';

class PlayStoreComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return PlayStoreBase(id);
  }
}

class PlayStoreBase extends AbstractPlayStoreComponent {
  final String? id;

  PlayStoreBase(this.id) : super(playStoreID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PlayStoreRepository getPlayStoreRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .playStoreRepository(AccessBloc.appId(context))!;
  }

  @override
  Widget yourWidget(BuildContext context, PlayStoreModel? value) {
    return PlayStore(value);
  }
}

class PlayStore extends StatefulWidget {
  final PlayStoreModel? playStoreModel;

  PlayStore(this.playStoreModel);

  @override
  State<StatefulWidget> createState() {
    return PlayStoreState();
  }
}

class PlayStoreState extends State<PlayStore> {
  PlayStoreState();

  Widget _buildStack(double size, Widget image, String? name) => Container(
        height: size,
        width: size,
        child: image,
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppModel?>>(
      future: AbstractMainRepositorySingleton.singleton
          .appRepository()!
          .valuesList(),
      builder: (BuildContext context, AsyncSnapshot<List<AppModel?>> snapshot) {
        if (snapshot.hasData) {
          return _build(context, snapshot.data!);
        } else {
          return StyleRegistry.registry()
              .styleWithContext(context)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(context);
        }
      },
    );
  }

  Widget _build(BuildContext context, List<AppModel?> apps) {
    var appID = AccessBloc.appId(context);

    var size = 150.0;
    var components = <Widget>[];
    apps.forEach((model) {
      if (!AccessBloc.isPlayStoreApp(context, model!.documentID!)) {
        var children = <Widget>[];
        children.add(StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .containerStyle()
            .actionContainer(context,
                child: GestureDetector(
                    onTap: () async {
                      EliudRouter.Router.navigateTo(
                          context, SwitchApp(appID, toAppID: model.documentID));
                    },
                    child: Container(
                        width: 100, height: 100,
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(model.logoURL!),
                        ))));
        components.add(Column(children: children));
      }
    });

    var count = (fullScreenWidth(context) / size).floor() + 1;
    var rows = ((components.length - 1) / count).floor() + 1;
    var fullHeight = rows * size;
    // end tests

    if (components.isNotEmpty) {
      return Container(
          height: fullHeight,
          child: GridView.extent(
              maxCrossAxisExtent: size,
              padding: const EdgeInsets.all(0),
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              physics: ScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              children: components));
    } else {
      return Text('No apps available');
    }
  }
}
