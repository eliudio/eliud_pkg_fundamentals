import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';
import 'package:flutter/material.dart';

class SimpleTextComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return SimpleTextComponent(simpleTextID: id);
  }
}

class SimpleTextComponent extends AbstractSimpleTextComponent {
  SimpleTextComponent({String? simpleTextID}) : super(simpleTextID: simpleTextID);

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
    var app = AccessBloc.app(context)!;
    var frontEndStyle = StyleRegistry.registry().styleWithContext(context).frontEndStyle();
    var text = ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          frontEndStyle.textStyle().h1(context, value.title!),
          Container(height: 20),
          frontEndStyle.textStyle().h5(context, value.text!, textAlign: toTextAlign(value.textAlign)),
        ]);
    return text;
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  SimpleTextRepository getSimpleTextRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.simpleTextRepository(AccessBloc.appId(context))!;
  }
}
