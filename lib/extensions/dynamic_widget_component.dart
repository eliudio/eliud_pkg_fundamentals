// UPGRADE dynamic_widget
// import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/dynamic_widget_component.dart';
import '../model/dynamic_widget_model.dart';

class DynamicWidgetComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return DynamicWidgetComponent(key: key, app: app, documentId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await documentRepository(appId: app.documentID)!.get(id);
}

class DynamicWidgetComponent extends AbstractDynamicWidgetComponent {
  DynamicWidgetComponent(
      {super.key, required super.app, required String documentId})
      : super(dynamicWidgetId: documentId);

  @override
  Widget yourWidget(BuildContext context, DynamicWidgetModel? value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
// UPGRADE dynamic_widget
        return text(app, context,
            "dynamic_widget needs an upgrade cos it includes reference to RaisedButton which has been removed from flutter sdk");
/*
        var theWidget = DynamicWidgetBuilder.build(value!.content ?? '', context, DefaultClickListener());
        if (theWidget != null) {
          return theWidget;
        } else {
          return text(app, context, "Couldn't create the contents");
        }
*/
      } else {
        return progressIndicator(app, context);
      }
    });
  }
}

// UPGRADE dynamic_widget
/*
class DefaultClickListener implements ClickListener{
  @override
  void onClicked(String? event) {
    if (event != null) {
      print('Receive click event: ' + event);
    } else {
      print('Receive click without event');
    }
  }

}
*/
