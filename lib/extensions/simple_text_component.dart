import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';
import 'package:flutter/material.dart';

class SimpleTextComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return SimpleTextComponent(key: key, simpleTextID: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await simpleTextRepository(appId: appId)!.get(id);
}

class SimpleTextComponent extends AbstractSimpleTextComponent {
  SimpleTextComponent({Key? key, required String simpleTextID}) : super(key: key, simpleTextID: simpleTextID);

  TextAlign toTextAlign(SimpleTextAlign? textAlign) {
    switch (textAlign) {
      case SimpleTextAlign.Left: return TextAlign.left;
      case SimpleTextAlign.Center: return TextAlign.center;
      case SimpleTextAlign.Right: return TextAlign.right;
      case SimpleTextAlign.End: return TextAlign.end;
      case SimpleTextAlign.Justify: return TextAlign.justify;
      case SimpleTextAlign.Start: return TextAlign.start;
      case SimpleTextAlign.Unknown: return TextAlign.left;
    }
    return TextAlign.left;
  }

  @override
  Widget yourWidget(BuildContext context, SimpleTextModel? value) {
    if (value == null) return Text('No simple text');
    var text = ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          h1(context, value.title!),
          Container(height: 20),
          h5(context, value.text!, textAlign: toTextAlign(value.textAlign)),
        ]);
    return text;
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  SimpleTextRepository getSimpleTextRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.simpleTextRepository(AccessBloc.currentAppId(context))!;
  }
}
