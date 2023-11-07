import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:flutter/material.dart';

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
      await gridRepository(appId: app.documentID)!.get(id);
}

class GridComponent extends AbstractGridComponent {
  GridComponent({super.key, required super.app, required super.gridId});

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
