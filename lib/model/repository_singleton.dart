/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/booklet_firestore.dart';
import '../model/booklet_repository.dart';
import '../model/booklet_cache.dart';
import '../model/divider_firestore.dart';
import '../model/divider_repository.dart';
import '../model/divider_cache.dart';
import '../model/document_firestore.dart';
import '../model/document_repository.dart';
import '../model/document_cache.dart';
import '../model/document_item_repository.dart';
import '../model/document_item_cache.dart';
import '../model/fader_firestore.dart';
import '../model/fader_repository.dart';
import '../model/fader_cache.dart';
import '../model/grid_firestore.dart';
import '../model/grid_repository.dart';
import '../model/grid_cache.dart';
import '../model/link_repository.dart';
import '../model/link_cache.dart';
import '../model/listed_item_repository.dart';
import '../model/listed_item_cache.dart';
import '../model/play_store_firestore.dart';
import '../model/play_store_repository.dart';
import '../model/play_store_cache.dart';
import '../model/presentation_firestore.dart';
import '../model/presentation_repository.dart';
import '../model/presentation_cache.dart';
import '../model/section_repository.dart';
import '../model/section_cache.dart';
import '../model/simple_image_firestore.dart';
import '../model/simple_image_repository.dart';
import '../model/simple_image_cache.dart';
import '../model/tutorial_firestore.dart';
import '../model/tutorial_repository.dart';
import '../model/tutorial_cache.dart';
import '../model/tutorial_entry_repository.dart';
import '../model/tutorial_entry_cache.dart';

import '../model/document_model.dart';
import '../model/document_item_model.dart';
import '../model/grid_model.dart';
import '../model/listed_item_model.dart';
import '../model/play_store_model.dart';
import '../model/presentation_model.dart';
import '../model/section_model.dart';
import '../model/simple_image_model.dart';
import '../model/tutorial_entry_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _bookletRepository = HashMap<String, BookletRepository>();
    var _dividerRepository = HashMap<String, DividerRepository>();
    var _documentRepository = HashMap<String, DocumentRepository>();
    var _faderRepository = HashMap<String, FaderRepository>();
    var _gridRepository = HashMap<String, GridRepository>();
    var _playStoreRepository = HashMap<String, PlayStoreRepository>();
    var _presentationRepository = HashMap<String, PresentationRepository>();
    var _simpleImageRepository = HashMap<String, SimpleImageRepository>();
    var _tutorialRepository = HashMap<String, TutorialRepository>();

    BookletRepository bookletRepository(String appID) {
      if (_bookletRepository[appID] == null) _bookletRepository[appID] = BookletCache(BookletFirestore(appID));
      return _bookletRepository[appID];
    }
    DividerRepository dividerRepository(String appID) {
      if (_dividerRepository[appID] == null) _dividerRepository[appID] = DividerCache(DividerFirestore(appID));
      return _dividerRepository[appID];
    }
    DocumentRepository documentRepository(String appID) {
      if (_documentRepository[appID] == null) _documentRepository[appID] = DocumentCache(DocumentFirestore(appID));
      return _documentRepository[appID];
    }
    FaderRepository faderRepository(String appID) {
      if (_faderRepository[appID] == null) _faderRepository[appID] = FaderCache(FaderFirestore(appID));
      return _faderRepository[appID];
    }
    GridRepository gridRepository(String appID) {
      if (_gridRepository[appID] == null) _gridRepository[appID] = GridCache(GridFirestore(appID));
      return _gridRepository[appID];
    }
    PlayStoreRepository playStoreRepository(String appID) {
      if (_playStoreRepository[appID] == null) _playStoreRepository[appID] = PlayStoreCache(PlayStoreFirestore(appID));
      return _playStoreRepository[appID];
    }
    PresentationRepository presentationRepository(String appID) {
      if (_presentationRepository[appID] == null) _presentationRepository[appID] = PresentationCache(PresentationFirestore(appID));
      return _presentationRepository[appID];
    }
    SimpleImageRepository simpleImageRepository(String appID) {
      if (_simpleImageRepository[appID] == null) _simpleImageRepository[appID] = SimpleImageCache(SimpleImageFirestore(appID));
      return _simpleImageRepository[appID];
    }
    TutorialRepository tutorialRepository(String appID) {
      if (_tutorialRepository[appID] == null) _tutorialRepository[appID] = TutorialCache(TutorialFirestore(appID));
      return _tutorialRepository[appID];
    }

}
