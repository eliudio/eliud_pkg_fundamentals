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
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/document_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DocumentItemModel {
  String? documentID;

  // This is the reference which you can use inside your document to use to this image, e.g. <img src = \"\${REFERENCE}\"
  String? reference;
  MemberMediumModel? image;

  DocumentItemModel({this.documentID, this.reference, this.image, })  {
    assert(documentID != null);
  }

  DocumentItemModel copyWith({String? documentID, String? reference, MemberMediumModel? image, }) {
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

  DocumentItemEntity toEntity({String? appId}) {
    return DocumentItemEntity(
          reference: (reference != null) ? reference : null, 
          imageId: (image != null) ? image!.documentID : null, 
    );
  }

  static DocumentItemModel? fromEntity(String documentID, DocumentItemEntity? entity) {
    if (entity == null) return null;
    return DocumentItemModel(
          documentID: documentID, 
          reference: entity.reference, 
    );
  }

  static Future<DocumentItemModel?> fromEntityPlus(String documentID, DocumentItemEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await memberMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving memberMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    return DocumentItemModel(
          documentID: documentID, 
          reference: entity.reference, 
          image: imageHolder, 
    );
  }

}

