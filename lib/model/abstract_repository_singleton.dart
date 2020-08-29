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

BookletRepository bookletRepository() => AbstractRepositorySingleton.singleton.bookletRepository();
DividerRepository dividerRepository() => AbstractRepositorySingleton.singleton.dividerRepository();
DocumentRepository documentRepository() => AbstractRepositorySingleton.singleton.documentRepository();
FaderRepository faderRepository() => AbstractRepositorySingleton.singleton.faderRepository();
GridRepository gridRepository() => AbstractRepositorySingleton.singleton.gridRepository();
PlayStoreRepository playStoreRepository() => AbstractRepositorySingleton.singleton.playStoreRepository();
PresentationRepository presentationRepository() => AbstractRepositorySingleton.singleton.presentationRepository();
SimpleImageRepository simpleImageRepository() => AbstractRepositorySingleton.singleton.simpleImageRepository();
TutorialRepository tutorialRepository() => AbstractRepositorySingleton.singleton.tutorialRepository();

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  BookletRepository bookletRepository();
  DividerRepository dividerRepository();
  DocumentRepository documentRepository();
  FaderRepository faderRepository();
  GridRepository gridRepository();
  PlayStoreRepository playStoreRepository();
  PresentationRepository presentationRepository();
  SimpleImageRepository simpleImageRepository();
  TutorialRepository tutorialRepository();

  void flush() {
    bookletRepository().flush();
    dividerRepository().flush();
    documentRepository().flush();
    faderRepository().flush();
    gridRepository().flush();
    playStoreRepository().flush();
    presentationRepository().flush();
    simpleImageRepository().flush();
    tutorialRepository().flush();
  }
}
