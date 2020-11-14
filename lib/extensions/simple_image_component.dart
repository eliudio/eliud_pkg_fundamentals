import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';

class SimpleImageComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return SimpleImageComponent(simpleImageID: id);
  }
}

class SimpleImageComponent extends AbstractSimpleImageComponent {
  SimpleImageComponent({String simpleImageID}) : super(simpleImageID: simpleImageID);

  @override
  Widget yourWidget(BuildContext context, SimpleImageModel value) {
    var state = AccessBloc.getState(context);
    return AbstractPlatform.platform.getImage(state, image: value.image);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  SimpleImageRepository getSimpleImageRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.simpleImageRepository(AppBloc.appId(context));
  }
}
