/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/decorated_content_repository.dart';
import '../model/divider_repository.dart';
import '../model/document_item_repository.dart';
import '../model/fader_repository.dart';
import '../model/grid_repository.dart';
import '../model/link_repository.dart';
import '../model/listed_item_repository.dart';
import '../model/presentation_repository.dart';
import '../model/simple_image_repository.dart';
import '../model/simple_text_repository.dart';
import '../model/tutorial_repository.dart';
import '../model/tutorial_entry_repository.dart';
import '../model/booklet_repository.dart';
import '../model/document_repository.dart';
import '../model/section_repository.dart';
import 'package:eliud_core/core/blocs/access/repo/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/package/package.dart';

DecoratedContentRepository? decoratedContentRepository({ String? appId }) => AbstractRepositorySingleton.singleton.decoratedContentRepository(appId);
DividerRepository? dividerRepository({ String? appId }) => AbstractRepositorySingleton.singleton.dividerRepository(appId);
FaderRepository? faderRepository({ String? appId }) => AbstractRepositorySingleton.singleton.faderRepository(appId);
GridRepository? gridRepository({ String? appId }) => AbstractRepositorySingleton.singleton.gridRepository(appId);
PresentationRepository? presentationRepository({ String? appId }) => AbstractRepositorySingleton.singleton.presentationRepository(appId);
SimpleImageRepository? simpleImageRepository({ String? appId }) => AbstractRepositorySingleton.singleton.simpleImageRepository(appId);
SimpleTextRepository? simpleTextRepository({ String? appId }) => AbstractRepositorySingleton.singleton.simpleTextRepository(appId);
TutorialRepository? tutorialRepository({ String? appId }) => AbstractRepositorySingleton.singleton.tutorialRepository(appId);
BookletRepository? bookletRepository({ String? appId }) => AbstractRepositorySingleton.singleton.bookletRepository(appId);
DocumentRepository? documentRepository({ String? appId }) => AbstractRepositorySingleton.singleton.documentRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
  ];
  static late AbstractRepositorySingleton singleton;

  DecoratedContentRepository? decoratedContentRepository(String? appId);
  DividerRepository? dividerRepository(String? appId);
  FaderRepository? faderRepository(String? appId);
  GridRepository? gridRepository(String? appId);
  PresentationRepository? presentationRepository(String? appId);
  SimpleImageRepository? simpleImageRepository(String? appId);
  SimpleTextRepository? simpleTextRepository(String? appId);
  TutorialRepository? tutorialRepository(String? appId);
  BookletRepository? bookletRepository(String? appId);
  DocumentRepository? documentRepository(String? appId);

  void flush(String? appId) {
    decoratedContentRepository(appId)!.flush();
    dividerRepository(appId)!.flush();
    faderRepository(appId)!.flush();
    gridRepository(appId)!.flush();
    presentationRepository(appId)!.flush();
    simpleImageRepository(appId)!.flush();
    simpleTextRepository(appId)!.flush();
    tutorialRepository(appId)!.flush();
    bookletRepository(appId)!.flush();
    documentRepository(appId)!.flush();
  }
}
