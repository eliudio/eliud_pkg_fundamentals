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

import '../model/booklet_repository.dart';
import '../model/divider_repository.dart';
import '../model/document_repository.dart';
import '../model/document_item_repository.dart';
import '../model/fader_repository.dart';
import '../model/grid_repository.dart';
import '../model/link_repository.dart';
import '../model/listed_item_repository.dart';
import '../model/photo_and_text_repository.dart';
import '../model/play_store_repository.dart';
import '../model/presentation_repository.dart';
import '../model/section_repository.dart';
import '../model/simple_image_repository.dart';
import '../model/tutorial_repository.dart';
import '../model/tutorial_entry_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

BookletRepository bookletRepository({ String appId }) => AbstractRepositorySingleton.singleton.bookletRepository(appId);
DividerRepository dividerRepository({ String appId }) => AbstractRepositorySingleton.singleton.dividerRepository(appId);
DocumentRepository documentRepository({ String appId }) => AbstractRepositorySingleton.singleton.documentRepository(appId);
FaderRepository faderRepository({ String appId }) => AbstractRepositorySingleton.singleton.faderRepository(appId);
GridRepository gridRepository({ String appId }) => AbstractRepositorySingleton.singleton.gridRepository(appId);
PhotoAndTextRepository photoAndTextRepository({ String appId }) => AbstractRepositorySingleton.singleton.photoAndTextRepository(appId);
PlayStoreRepository playStoreRepository({ String appId }) => AbstractRepositorySingleton.singleton.playStoreRepository(appId);
PresentationRepository presentationRepository({ String appId }) => AbstractRepositorySingleton.singleton.presentationRepository(appId);
SimpleImageRepository simpleImageRepository({ String appId }) => AbstractRepositorySingleton.singleton.simpleImageRepository(appId);
TutorialRepository tutorialRepository({ String appId }) => AbstractRepositorySingleton.singleton.tutorialRepository(appId);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  BookletRepository bookletRepository(String appId);
  DividerRepository dividerRepository(String appId);
  DocumentRepository documentRepository(String appId);
  FaderRepository faderRepository(String appId);
  GridRepository gridRepository(String appId);
  PhotoAndTextRepository photoAndTextRepository(String appId);
  PlayStoreRepository playStoreRepository(String appId);
  PresentationRepository presentationRepository(String appId);
  SimpleImageRepository simpleImageRepository(String appId);
  TutorialRepository tutorialRepository(String appId);

  void flush(String appId) {
  }
}
