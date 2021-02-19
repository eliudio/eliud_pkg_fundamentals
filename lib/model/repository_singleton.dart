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
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
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
import '../model/photo_and_text_firestore.dart';
import '../model/photo_and_text_repository.dart';
import '../model/photo_and_text_cache.dart';

import '../model/document_model.dart';
import '../model/document_item_model.dart';
import '../model/grid_model.dart';
import '../model/listed_item_model.dart';
import '../model/play_store_model.dart';
import '../model/presentation_model.dart';
import '../model/section_model.dart';
import '../model/simple_image_model.dart';
import '../model/tutorial_entry_model.dart';
import '../model/photo_and_text_model.dart';

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
    var _photoAndTextRepository = HashMap<String, PhotoAndTextRepository>();

    BookletRepository bookletRepository(String appId) {
      if (_bookletRepository[appId] == null) _bookletRepository[appId] = BookletCache(BookletFirestore(appRepository().getSubCollection(appId, 'booklet'), appId));
      return _bookletRepository[appId];
    }
    DividerRepository dividerRepository(String appId) {
      if (_dividerRepository[appId] == null) _dividerRepository[appId] = DividerCache(DividerFirestore(appRepository().getSubCollection(appId, 'divider'), appId));
      return _dividerRepository[appId];
    }
    DocumentRepository documentRepository(String appId) {
      if (_documentRepository[appId] == null) _documentRepository[appId] = DocumentCache(DocumentFirestore(appRepository().getSubCollection(appId, 'document'), appId));
      return _documentRepository[appId];
    }
    FaderRepository faderRepository(String appId) {
      if (_faderRepository[appId] == null) _faderRepository[appId] = FaderCache(FaderFirestore(appRepository().getSubCollection(appId, 'fader'), appId));
      return _faderRepository[appId];
    }
    GridRepository gridRepository(String appId) {
      if (_gridRepository[appId] == null) _gridRepository[appId] = GridCache(GridFirestore(appRepository().getSubCollection(appId, 'grid'), appId));
      return _gridRepository[appId];
    }
    PlayStoreRepository playStoreRepository(String appId) {
      if (_playStoreRepository[appId] == null) _playStoreRepository[appId] = PlayStoreCache(PlayStoreFirestore(appRepository().getSubCollection(appId, 'playstore'), appId));
      return _playStoreRepository[appId];
    }
    PresentationRepository presentationRepository(String appId) {
      if (_presentationRepository[appId] == null) _presentationRepository[appId] = PresentationCache(PresentationFirestore(appRepository().getSubCollection(appId, 'presentation'), appId));
      return _presentationRepository[appId];
    }
    SimpleImageRepository simpleImageRepository(String appId) {
      if (_simpleImageRepository[appId] == null) _simpleImageRepository[appId] = SimpleImageCache(SimpleImageFirestore(appRepository().getSubCollection(appId, 'simpleimage'), appId));
      return _simpleImageRepository[appId];
    }
    TutorialRepository tutorialRepository(String appId) {
      if (_tutorialRepository[appId] == null) _tutorialRepository[appId] = TutorialCache(TutorialFirestore(appRepository().getSubCollection(appId, 'tutorial'), appId));
      return _tutorialRepository[appId];
    }
    PhotoAndTextRepository photoAndTextRepository(String appId) {
      if (_photoAndTextRepository[appId] == null) _photoAndTextRepository[appId] = PhotoAndTextCache(PhotoAndTextFirestore(appRepository().getSubCollection(appId, 'photoandtext'), appId));
      return _photoAndTextRepository[appId];
    }

}
