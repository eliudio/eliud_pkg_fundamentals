import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';


class TutorialComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return TutorialComponent(tutorialID: id);
  }
}

class TutorialComponent extends AbstractTutorialComponent {
  TutorialComponent({String tutorialID})
      : super(tutorialID: tutorialID);

  Widget _aBitSpace() => SizedBox(
      height: 20,
      child: null,
    );

  @override
  Widget yourWidget(BuildContext context, TutorialModel value) {
    DocumentParameterProcessor documentParameterProcessor = ExtendedDocumentParameterProcessor(context);
    List<Widget> widgets = List();
    widgets.add(Text(
      documentParameterProcessor.process(value.title),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
    widgets.add(_aBitSpace());
    value.tutorialEntries.forEach((element) {
      widgets.add(Text(
        documentParameterProcessor.process(element.description),
      ));
      widgets.add(_aBitSpace());
      if (element.image != null) {
        widgets.add(GestureDetector(
          child: AbstractPlatform.platform.getImage(image: element.image),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return FulLScreen(element.image);
            }));
          },
        ));

        widgets.add(Center(child: OutlineButton(
            child: Text("Fullscreen"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return FulLScreen(element.image);
              }));
            },
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        )));

        widgets.add(_aBitSpace());
      }
      if (element.code != null) {
        widgets.add(MarkdownBody(selectable: true, data: "```\n" + element.code + "```"));
        widgets.add(
          Center(child:
          OutlineButton(
              child: new Text("Copy to clipboard"),
              onPressed: (){
                Clipboard.setData(ClipboardData(text: element.code));
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          )));
        widgets.add(_aBitSpace());
      }
    });

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

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  TutorialRepository getTutorialRepository() {
    return AbstractRepositorySingleton.singleton.tutorialRepository();
  }
}

class FulLScreen extends StatelessWidget {
  final ImageModel image;

  FulLScreen(this.image);

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider = AbstractPlatform.platform.getImageProviderFromURL(image.imageURLOriginal);
    return Scaffold(
      body: GestureDetector(
        child:  PhotoView(
          initialScale: PhotoViewComputedScale.covered,
          imageProvider: imageProvider),
        onTap: () {
           Navigator.pop(context);
          },
      ),
    );
  }
}