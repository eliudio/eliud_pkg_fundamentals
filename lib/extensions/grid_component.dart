import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return GridComponent(key: key, app: app, gridId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await gridRepository(appId: app.documentID!)!.get(id);
}

class GridComponent extends AbstractGridComponent {
  GridComponent({Key? key, required AppModel app, required String gridId})
      : super(key: key, app: app, gridId: gridId);

  @override
  Widget yourWidget(BuildContext context, GridModel? value) {
    var components = value!.bodyComponents!
        .map((model) => Registry.registry()!
            .component(context, app, model.componentName!, model.componentId!))
        .toList();
    if (components.isNotEmpty) {
      return GridViewHelper.container(context, components, value.gridView);
    } else {
      return AlertWidget(
          app: app, title: 'Error', content: 'No components for this grid');
    }
  }
}
