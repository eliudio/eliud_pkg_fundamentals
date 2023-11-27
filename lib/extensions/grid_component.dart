import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core/tools/etc/grid_view_helper.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core_main/apis/apis.dart';

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
        .map((model) => Apis.apis()
            .getRegistryApi()
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
