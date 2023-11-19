import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_model.dart';
import 'package:flutter/material.dart';

class DividerComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return DividerComponent(key: key, app: app, dividerId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await dividerRepository(appId: app.documentID)!.get(id);
}

class DividerComponent extends AbstractDividerComponent {
  DividerComponent({super.key, required super.app, required super.dividerId});

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
