import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


class TutorialComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return TutorialComponent(tutorialID: id);
  }
}

class TutorialComponent extends AbstractTutorialComponent {
  TutorialComponent({String? tutorialID})
      : super(tutorialID: tutorialID);

  Widget _aBitSpace() => SizedBox(
      height: 20,
      child: null,
    );

  @override
  Widget yourWidget(BuildContext context, TutorialModel? value) {
    var accessState = AccessBloc.getState(context);
    DocumentParameterProcessor documentParameterProcessor = ExtendedDocumentParameterProcessor(context, accessState);
    var widgets = <Widget>[];
    widgets.add(Text(
      documentParameterProcessor.process(value!.title!),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
    widgets.add(_aBitSpace());
    value.tutorialEntries!.forEach((element) {
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
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return FulLScreen(element.image);
            }));
          },
        ));

        widgets.add(Center(child: OutlineButton(
            child: Text('Fullscreen'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return FulLScreen(element.image);
              }));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
        )));

        widgets.add(_aBitSpace());
      }
      if (element.code != null) {
        widgets.add(MarkdownBody(selectable: true, data: '```\n' + element.code! + '```'));
        widgets.add(
          Center(child:
          OutlineButton(
              child: Text('Copy to clipboard'),
              onPressed: (){
                Clipboard.setData(ClipboardData(text: element.code));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
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
  TutorialRepository getTutorialRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.tutorialRepository(AccessBloc.appId(context))!;
  }
}

class FulLScreen extends StatelessWidget {
  final MemberMediumModel? image;

  FulLScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child:  PhotoView(
          initialScale: PhotoViewComputedScale.covered,
          imageProvider: NetworkImage(image!.url!)),
        onTap: () {
           Navigator.pop(context);
          },
      ),
    );
  }
}