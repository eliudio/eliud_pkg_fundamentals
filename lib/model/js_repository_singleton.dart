/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/js_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/booklet_js_firestore.dart';
import '../model/booklet_repository.dart';
import '../model/booklet_cache.dart';
import '../model/divider_js_firestore.dart';
import '../model/divider_repository.dart';
import '../model/divider_cache.dart';
import '../model/document_js_firestore.dart';
import '../model/document_repository.dart';
import '../model/document_cache.dart';
import '../model/document_item_repository.dart';
import '../model/document_item_cache.dart';
import '../model/fader_js_firestore.dart';
import '../model/fader_repository.dart';
import '../model/fader_cache.dart';
import '../model/grid_js_firestore.dart';
import '../model/grid_repository.dart';
import '../model/grid_cache.dart';
import '../model/link_repository.dart';
import '../model/link_cache.dart';
import '../model/listed_item_repository.dart';
import '../model/listed_item_cache.dart';
import '../model/play_store_js_firestore.dart';
import '../model/play_store_repository.dart';
import '../model/play_store_cache.dart';
import '../model/presentation_js_firestore.dart';
import '../model/presentation_repository.dart';
import '../model/presentation_cache.dart';
import '../model/section_repository.dart';
import '../model/section_cache.dart';
import '../model/simple_image_js_firestore.dart';
import '../model/simple_image_repository.dart';
import '../model/simple_image_cache.dart';
import '../model/tutorial_js_firestore.dart';
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

class JsRepositorySingleton extends AbstractRepositorySingleton {
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
      if (_bookletRepository[appID] == null) _bookletRepository[appID] = BookletCache(BookletJsFirestore(appID));
      return _bookletRepository[appID];
    }
    DividerRepository dividerRepository(String appID) {
      if (_dividerRepository[appID] == null) _dividerRepository[appID] = DividerCache(DividerJsFirestore(appID));
      return _dividerRepository[appID];
    }
    DocumentRepository documentRepository(String appID) {
      if (_documentRepository[appID] == null) _documentRepository[appID] = DocumentCache(DocumentJsFirestore(appID));
      return _documentRepository[appID];
    }
    FaderRepository faderRepository(String appID) {
      if (_faderRepository[appID] == null) _faderRepository[appID] = FaderCache(FaderJsFirestore(appID));
      return _faderRepository[appID];
    }
    GridRepository gridRepository(String appID) {
      if (_gridRepository[appID] == null) _gridRepository[appID] = GridCache(GridJsFirestore(appID));
      return _gridRepository[appID];
    }
    PlayStoreRepository playStoreRepository(String appID) {
      if (_playStoreRepository[appID] == null) _playStoreRepository[appID] = PlayStoreCache(PlayStoreJsFirestore(appID));
      return _playStoreRepository[appID];
    }
    PresentationRepository presentationRepository(String appID) {
      if (_presentationRepository[appID] == null) _presentationRepository[appID] = PresentationCache(PresentationJsFirestore(appID));
      return _presentationRepository[appID];
    }
    SimpleImageRepository simpleImageRepository(String appID) {
      if (_simpleImageRepository[appID] == null) _simpleImageRepository[appID] = SimpleImageCache(SimpleImageJsFirestore(appID));
      return _simpleImageRepository[appID];
    }
    TutorialRepository tutorialRepository(String appID) {
      if (_tutorialRepository[appID] == null) _tutorialRepository[appID] = TutorialCache(TutorialJsFirestore(appID));
      return _tutorialRepository[appID];
    }

}
