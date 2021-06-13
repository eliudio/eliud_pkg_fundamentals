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

import 'dart:collection';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

import '../model/booklet_cache.dart';
import '../model/booklet_firestore.dart';
import '../model/booklet_repository.dart';
import '../model/decorated_content_cache.dart';
import '../model/decorated_content_firestore.dart';
import '../model/decorated_content_repository.dart';
import '../model/divider_cache.dart';
import '../model/divider_firestore.dart';
import '../model/divider_repository.dart';
import '../model/document_cache.dart';
import '../model/document_firestore.dart';
import '../model/document_repository.dart';
import '../model/fader_cache.dart';
import '../model/fader_firestore.dart';
import '../model/fader_repository.dart';
import '../model/grid_cache.dart';
import '../model/grid_firestore.dart';
import '../model/grid_repository.dart';
import '../model/play_store_cache.dart';
import '../model/play_store_firestore.dart';
import '../model/play_store_repository.dart';
import '../model/presentation_cache.dart';
import '../model/presentation_firestore.dart';
import '../model/presentation_repository.dart';
import '../model/simple_image_cache.dart';
import '../model/simple_image_firestore.dart';
import '../model/simple_image_repository.dart';
import '../model/simple_text_cache.dart';
import '../model/simple_text_firestore.dart';
import '../model/simple_text_repository.dart';
import '../model/tutorial_cache.dart';
import '../model/tutorial_firestore.dart';
import '../model/tutorial_repository.dart';
import 'abstract_repository_singleton.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _bookletRepository = HashMap<String, BookletRepository>();
    var _decoratedContentRepository = HashMap<String, DecoratedContentRepository>();
    var _dividerRepository = HashMap<String, DividerRepository>();
    var _documentRepository = HashMap<String, DocumentRepository>();
    var _faderRepository = HashMap<String, FaderRepository>();
    var _gridRepository = HashMap<String, GridRepository>();
    var _playStoreRepository = HashMap<String, PlayStoreRepository>();
    var _presentationRepository = HashMap<String, PresentationRepository>();
    var _simpleImageRepository = HashMap<String, SimpleImageRepository>();
    var _simpleTextRepository = HashMap<String, SimpleTextRepository>();
    var _tutorialRepository = HashMap<String, TutorialRepository>();

    BookletRepository? bookletRepository(String? appId) {
      if ((appId != null) && (_bookletRepository[appId] == null)) _bookletRepository[appId] = BookletCache(BookletFirestore(appRepository()!.getSubCollection(appId, 'booklet'), appId));
      return _bookletRepository[appId];
    }
    DecoratedContentRepository? decoratedContentRepository(String? appId) {
      if ((appId != null) && (_decoratedContentRepository[appId] == null)) _decoratedContentRepository[appId] = DecoratedContentCache(DecoratedContentFirestore(appRepository()!.getSubCollection(appId, 'decoratedcontent'), appId));
      return _decoratedContentRepository[appId];
    }
    DividerRepository? dividerRepository(String? appId) {
      if ((appId != null) && (_dividerRepository[appId] == null)) _dividerRepository[appId] = DividerCache(DividerFirestore(appRepository()!.getSubCollection(appId, 'divider'), appId));
      return _dividerRepository[appId];
    }
    DocumentRepository? documentRepository(String? appId) {
      if ((appId != null) && (_documentRepository[appId] == null)) _documentRepository[appId] = DocumentCache(DocumentFirestore(appRepository()!.getSubCollection(appId, 'document'), appId));
      return _documentRepository[appId];
    }
    FaderRepository? faderRepository(String? appId) {
      if ((appId != null) && (_faderRepository[appId] == null)) _faderRepository[appId] = FaderCache(FaderFirestore(appRepository()!.getSubCollection(appId, 'fader'), appId));
      return _faderRepository[appId];
    }
    GridRepository? gridRepository(String? appId) {
      if ((appId != null) && (_gridRepository[appId] == null)) _gridRepository[appId] = GridCache(GridFirestore(appRepository()!.getSubCollection(appId, 'grid'), appId));
      return _gridRepository[appId];
    }
    PlayStoreRepository? playStoreRepository(String? appId) {
      if ((appId != null) && (_playStoreRepository[appId] == null)) _playStoreRepository[appId] = PlayStoreCache(PlayStoreFirestore(appRepository()!.getSubCollection(appId, 'playstore'), appId));
      return _playStoreRepository[appId];
    }
    PresentationRepository? presentationRepository(String? appId) {
      if ((appId != null) && (_presentationRepository[appId] == null)) _presentationRepository[appId] = PresentationCache(PresentationFirestore(appRepository()!.getSubCollection(appId, 'presentation'), appId));
      return _presentationRepository[appId];
    }
    SimpleImageRepository? simpleImageRepository(String? appId) {
      if ((appId != null) && (_simpleImageRepository[appId] == null)) _simpleImageRepository[appId] = SimpleImageCache(SimpleImageFirestore(appRepository()!.getSubCollection(appId, 'simpleimage'), appId));
      return _simpleImageRepository[appId];
    }
    SimpleTextRepository? simpleTextRepository(String? appId) {
      if ((appId != null) && (_simpleTextRepository[appId] == null)) _simpleTextRepository[appId] = SimpleTextCache(SimpleTextFirestore(appRepository()!.getSubCollection(appId, 'simpletext'), appId));
      return _simpleTextRepository[appId];
    }
    TutorialRepository? tutorialRepository(String? appId) {
      if ((appId != null) && (_tutorialRepository[appId] == null)) _tutorialRepository[appId] = TutorialCache(TutorialFirestore(appRepository()!.getSubCollection(appId, 'tutorial'), appId));
      return _tutorialRepository[appId];
    }

}
