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

import 'package:eliud_core/package/package.dart';

import '../model/booklet_repository.dart';
import '../model/decorated_content_repository.dart';
import '../model/divider_repository.dart';
import '../model/document_repository.dart';
import '../model/fader_repository.dart';
import '../model/grid_repository.dart';
import '../model/play_store_repository.dart';
import '../model/presentation_repository.dart';
import '../model/simple_image_repository.dart';
import '../model/simple_text_repository.dart';
import '../model/tutorial_repository.dart';

BookletRepository? bookletRepository({ String? appId }) => AbstractRepositorySingleton.singleton.bookletRepository(appId);
DecoratedContentRepository? decoratedContentRepository({ String? appId }) => AbstractRepositorySingleton.singleton.decoratedContentRepository(appId);
DividerRepository? dividerRepository({ String? appId }) => AbstractRepositorySingleton.singleton.dividerRepository(appId);
DocumentRepository? documentRepository({ String? appId }) => AbstractRepositorySingleton.singleton.documentRepository(appId);
FaderRepository? faderRepository({ String? appId }) => AbstractRepositorySingleton.singleton.faderRepository(appId);
GridRepository? gridRepository({ String? appId }) => AbstractRepositorySingleton.singleton.gridRepository(appId);
PlayStoreRepository? playStoreRepository({ String? appId }) => AbstractRepositorySingleton.singleton.playStoreRepository(appId);
PresentationRepository? presentationRepository({ String? appId }) => AbstractRepositorySingleton.singleton.presentationRepository(appId);
SimpleImageRepository? simpleImageRepository({ String? appId }) => AbstractRepositorySingleton.singleton.simpleImageRepository(appId);
SimpleTextRepository? simpleTextRepository({ String? appId }) => AbstractRepositorySingleton.singleton.simpleTextRepository(appId);
TutorialRepository? tutorialRepository({ String? appId }) => AbstractRepositorySingleton.singleton.tutorialRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
  ];
  static late AbstractRepositorySingleton singleton;

  BookletRepository? bookletRepository(String? appId);
  DecoratedContentRepository? decoratedContentRepository(String? appId);
  DividerRepository? dividerRepository(String? appId);
  DocumentRepository? documentRepository(String? appId);
  FaderRepository? faderRepository(String? appId);
  GridRepository? gridRepository(String? appId);
  PlayStoreRepository? playStoreRepository(String? appId);
  PresentationRepository? presentationRepository(String? appId);
  SimpleImageRepository? simpleImageRepository(String? appId);
  SimpleTextRepository? simpleTextRepository(String? appId);
  TutorialRepository? tutorialRepository(String? appId);

  void flush(String? appId) {
  }
}
