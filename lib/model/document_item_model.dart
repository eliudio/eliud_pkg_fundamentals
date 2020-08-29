/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'document_item_entity.dart';
import 'package:eliud_core/tools/random.dart';



class DocumentItemModel {
  String documentID;

  // This is the reference which you can use inside your document to use to this image, e.g. <img src = \"\${REFERENCE}\"
  String reference;
  ImageModel image;

  DocumentItemModel({this.documentID, this.reference, this.image, })  {
    assert(documentID != null);
  }

  DocumentItemModel copyWith({String documentID, String reference, ImageModel image, }) {
    return DocumentItemModel(documentID: documentID ?? this.documentID, reference: reference ?? this.reference, image: image ?? this.image, );
  }

  @override
  int get hashCode => documentID.hashCode ^ reference.hashCode ^ image.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DocumentItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          reference == other.reference &&
          image == other.image;

  @override
  String toString() {
    return 'DocumentItemModel{documentID: $documentID, reference: $reference, image: $image}';
  }

  DocumentItemEntity toEntity() {
    return DocumentItemEntity(
          reference: (reference != null) ? reference : null, 
          imageId: (image != null) ? image.documentID : null, 
    );
  }

  static DocumentItemModel fromEntity(String documentID, DocumentItemEntity entity) {
    if (entity == null) return null;
    return DocumentItemModel(
          documentID: documentID, 
          reference: entity.reference, 
    );
  }

  static Future<DocumentItemModel> fromEntityPlus(String documentID, DocumentItemEntity entity) async {
    if (entity == null) return null;

    ImageModel imageHolder;
    if (entity.imageId != null) {
      try {
        await imageRepository().get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return DocumentItemModel(
          documentID: documentID, 
          reference: entity.reference, 
          image: imageHolder, 
    );
  }

}

