import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
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
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return GridComponent(key: key, gridID: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await gridRepository(appId: appId)!.get(id);
}

class GridComponent extends AbstractGridComponent {
  GridComponent({Key? key, required String gridID}) : super(key: key, gridID: gridID);

  @override
  Widget yourWidget(BuildContext context, GridModel? value) {
    var components = value!.bodyComponents!
        .map((model) =>
        Registry.registry()!.component(context,
            model.componentName!, model.componentId!))
        .toList();
    if (components.isNotEmpty) {
      return GridViewHelper.container(context, components, value.gridView);
    } else {
      return alertWidget(
          title: 'Error', content: 'No components for this grid');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  GridRepository getGridRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.gridRepository(AccessBloc.currentAppId(context))!;
  }
}
