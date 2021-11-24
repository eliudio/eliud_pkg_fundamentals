import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';
import 'package:flutter/material.dart';

class DividerComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters}) {
    return DividerComponent(key: key, appId: appId, dividerId: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await dividerRepository(appId: appId)!.get(id);
}

class DividerComponent extends AbstractDividerComponent {
  DividerComponent({Key? key, required String appId, required String dividerId}) : super(key: key, theAppId: appId, dividerId: dividerId);

  @override
  Widget yourWidget(BuildContext context, DividerModel? value) {
    return Divider(
      height: value!.height ?? 0,
      thickness: value.thickness ?? 0,
      indent: value.indent ?? 0,
      endIndent: value.endIndent ?? 0,
      color: RgbHelper.color(rgbo: value.color),
    );
  }
}
