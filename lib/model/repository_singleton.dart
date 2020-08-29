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
  RepositorySingleton(String appID) {
    _bookletRepository = BookletCache(BookletFirestore(appID));
    _dividerRepository = DividerCache(DividerFirestore(appID));
    _documentRepository = DocumentCache(DocumentFirestore(appID));
    _faderRepository = FaderCache(FaderFirestore(appID));
    _gridRepository = GridCache(GridFirestore(appID));
    _playStoreRepository = PlayStoreCache(PlayStoreFirestore(appID));
    _presentationRepository = PresentationCache(PresentationFirestore(appID));
    _simpleImageRepository = SimpleImageCache(SimpleImageFirestore(appID));
    _tutorialRepository = TutorialCache(TutorialFirestore(appID));
  }
  BookletRepository bookletRepository() => _bookletRepository;
  BookletRepository _bookletRepository;
  DividerRepository dividerRepository() => _dividerRepository;
  DividerRepository _dividerRepository;
  DocumentRepository documentRepository() => _documentRepository;
  DocumentRepository _documentRepository;
  FaderRepository faderRepository() => _faderRepository;
  FaderRepository _faderRepository;
  GridRepository gridRepository() => _gridRepository;
  GridRepository _gridRepository;
  PlayStoreRepository playStoreRepository() => _playStoreRepository;
  PlayStoreRepository _playStoreRepository;
  PresentationRepository presentationRepository() => _presentationRepository;
  PresentationRepository _presentationRepository;
  SimpleImageRepository simpleImageRepository() => _simpleImageRepository;
  SimpleImageRepository _simpleImageRepository;
  TutorialRepository tutorialRepository() => _tutorialRepository;
  TutorialRepository _tutorialRepository;

}
