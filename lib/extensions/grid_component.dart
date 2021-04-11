import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/material.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component.dart';

class GridComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, Object>? parameters}) {
    return GridComponent(gridID: id);
  }
}

class GridComponent extends AbstractGridComponent {
  GridComponent({String? gridID}) : super(gridID: gridID);

  @override
  Widget yourWidget(BuildContext context, GridModel? value) {
    var components = value!.bodyComponents!
        .map((model) => Registry.registry()!.component(
        model!.componentName!, model.componentId!))
        .toList();
    if (components.isNotEmpty) {
      return GridViewHelper.container(context, components, value.gridView);
    } else {
      return alertWidget(title: 'Error', content: 'No components for this grid');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  GridRepository getGridRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.gridRepository(AccessBloc.appId(context))!;
  }
}
