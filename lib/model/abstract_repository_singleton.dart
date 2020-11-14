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
import '../model/play_store_repository.dart';
import '../model/presentation_repository.dart';
import '../model/section_repository.dart';
import '../model/simple_image_repository.dart';
import '../model/tutorial_repository.dart';
import '../model/tutorial_entry_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/types.dart';

BookletRepository bookletRepository({ String appID }) => AbstractRepositorySingleton.singleton.bookletRepository(appID);
DividerRepository dividerRepository({ String appID }) => AbstractRepositorySingleton.singleton.dividerRepository(appID);
DocumentRepository documentRepository({ String appID }) => AbstractRepositorySingleton.singleton.documentRepository(appID);
FaderRepository faderRepository({ String appID }) => AbstractRepositorySingleton.singleton.faderRepository(appID);
GridRepository gridRepository({ String appID }) => AbstractRepositorySingleton.singleton.gridRepository(appID);
PlayStoreRepository playStoreRepository({ String appID }) => AbstractRepositorySingleton.singleton.playStoreRepository(appID);
PresentationRepository presentationRepository({ String appID }) => AbstractRepositorySingleton.singleton.presentationRepository(appID);
SimpleImageRepository simpleImageRepository({ String appID }) => AbstractRepositorySingleton.singleton.simpleImageRepository(appID);
TutorialRepository tutorialRepository({ String appID }) => AbstractRepositorySingleton.singleton.tutorialRepository(appID);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  BookletRepository bookletRepository(String appID);
  DividerRepository dividerRepository(String appID);
  DocumentRepository documentRepository(String appID);
  FaderRepository faderRepository(String appID);
  GridRepository gridRepository(String appID);
  PlayStoreRepository playStoreRepository(String appID);
  PresentationRepository presentationRepository(String appID);
  SimpleImageRepository simpleImageRepository(String appID);
  TutorialRepository tutorialRepository(String appID);

  void flush(String appID) {
    bookletRepository(appID).flush();
    dividerRepository(appID).flush();
    documentRepository(appID).flush();
    faderRepository(appID).flush();
    gridRepository(appID).flush();
    playStoreRepository(appID).flush();
    presentationRepository(appID).flush();
    simpleImageRepository(appID).flush();
    tutorialRepository(appID).flush();
  }
}
