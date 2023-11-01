/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/listed_item_entity.dart';




class ListedItemModel implements ModelBase {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'listedItems';

  String documentID;
  String? description;
  ActionModel? action;
  PlatformMediumModel? image;
  PosSizeModel? posSize;

  ListedItemModel({required this.documentID, this.description, this.action, this.image, this.posSize, })  {
  }

  ListedItemModel copyWith({String? documentID, String? description, ActionModel? action, PlatformMediumModel? image, PosSizeModel? posSize, }) {
    return ListedItemModel(documentID: documentID ?? this.documentID, description: description ?? this.description, action: action ?? this.action, image: image ?? this.image, posSize: posSize ?? this.posSize, );
  }

  @override
  int get hashCode => documentID.hashCode ^ description.hashCode ^ action.hashCode ^ image.hashCode ^ posSize.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ListedItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          description == other.description &&
          action == other.action &&
          image == other.image &&
          posSize == other.posSize;

  @override
  String toString() {
    return 'ListedItemModel{documentID: $documentID, description: $description, action: $action, image: $image, posSize: $posSize}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (image != null) {
      referencesCollector.add(ModelReference(PlatformMediumModel.packageName, PlatformMediumModel.id, image!));
    }
    if (action != null) referencesCollector.addAll(await action!.collectReferences(appId: appId));
    if (image != null) referencesCollector.addAll(await image!.collectReferences(appId: appId));
    if (posSize != null) referencesCollector.addAll(await posSize!.collectReferences(appId: appId));
    return referencesCollector;
  }

  ListedItemEntity toEntity({String? appId}) {
    return ListedItemEntity(
          description: (description != null) ? description : null, 
          action: (action != null) ? action!.toEntity(appId: appId) : null, 
          imageId: (image != null) ? image!.documentID : null, 
          posSize: (posSize != null) ? posSize!.toEntity(appId: appId) : null, 
    );
  }

  static Future<ListedItemModel?> fromEntity(String documentID, ListedItemEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return ListedItemModel(
          documentID: documentID, 
          description: entity.description, 
          action: 
            await ActionModel.fromEntity(entity.action), 
          posSize: 
            await PosSizeModel.fromEntity(entity.posSize), 
    );
  }

  static Future<ListedItemModel?> fromEntityPlus(String documentID, ListedItemEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await platformMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving platformMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return ListedItemModel(
          documentID: documentID, 
          description: entity.description, 
          action: 
            await ActionModel.fromEntityPlus(entity.action, appId: appId), 
          image: imageHolder, 
          posSize: 
            await PosSizeModel.fromEntityPlus(entity.posSize, appId: appId), 
    );
  }

}

