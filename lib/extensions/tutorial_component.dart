import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core_model/style/frontend/has_button.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals_model/tools/document_processor_extended.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:photo_view/photo_view.dart';
import 'package:transparent_image/transparent_image.dart';

class TutorialComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return TutorialComponent(app: app, tutorialId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await tutorialRepository(appId: app.documentID)!.get(id);
}

class TutorialComponent extends AbstractTutorialComponent {
  TutorialComponent({super.key, required super.app, required super.tutorialId});

  Widget _aBitSpace() => SizedBox(
        height: 20,
        child: null,
      );

  @override
  Widget yourWidget(BuildContext context, TutorialModel? value) {
    DocumentParameterProcessor documentParameterProcessor =
        ExtendedDocumentParameterProcessor(
      context,
      app,
    );
    var widgets = <Widget>[];
    widgets.add(Text(
      documentParameterProcessor.process(value!.title!),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
    widgets.add(_aBitSpace());
    for (var element in value.tutorialEntries!) {
      widgets.add(Text(
        documentParameterProcessor.process(element.description!),
      ));
      widgets.add(_aBitSpace());
      if (element.image != null) {
        widgets.add(GestureDetector(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: element.image!.url!,
          ),
          onTap: () {
            Navigator.push(context,
                pageRouteBuilder(app, page: FulLScreen(element.image)));
          },
        ));

        widgets.add(Center(
            child: button(app, context, label: 'Fullscreen', onPressed: () {
          Navigator.push(
              context, pageRouteBuilder(app, page: FulLScreen(element.image)));
        })));

        widgets.add(_aBitSpace());
      }
      if (element.code != null) {
        widgets.add(
            MarkdownBody(selectable: true, data: '```\n${element.code!}```'));
        widgets.add(Center(
            child: button(
          app,
          context,
          label: 'Copy to clipboard',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: element.code ?? ''));
          },
        )));
        widgets.add(_aBitSpace());
      }
    }

    return ListView(padding: EdgeInsets.all(10), children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.alphabetic,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        children: widgets,
      )
    ]);
  }
}

class FulLScreen extends StatelessWidget {
  final PlatformMediumModel? image;

  FulLScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: PhotoView(
            initialScale: PhotoViewComputedScale.covered,
            imageProvider: NetworkImage(image!.url!)),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
