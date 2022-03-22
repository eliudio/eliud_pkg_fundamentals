import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';

import 'fader_event.dart';
import 'fader_state.dart';

class FaderBloc
    extends Bloc<FaderEvent, FaderState> {
  final String appId;
//  final bool create; // don't think I need this!!!
  final EditorFeedback feedback;

  FaderBloc(this.appId, /*this.create, */ this.feedback)
      : super(FaderUninitialised());

  @override
  Stream<FaderState> mapEventToState(
      FaderEvent event) async* {
    if (event is FaderInitialise) {
      List<PublicMediumModel>? media = [];
      // retrieve the model, as it was retrieved without links
      var modelWithLinks = await faderRepository(appId: appId)!
          .get(event.model.documentID);
      if (modelWithLinks == null) {
        modelWithLinks = FaderModel(
          documentID: newRandomKey(),
          animationMilliseconds: 1000,
          imageSeconds: 1,
          items: [],
          conditions: StorageConditionsModel(
              privilegeLevelRequired: PrivilegeLevelRequiredSimple
                  .NoPrivilegeRequiredSimple),
        );
      } else {
        modelWithLinks = modelWithLinks.copyWith(
          animationMilliseconds: modelWithLinks.animationMilliseconds ?? 1000,
          imageSeconds: modelWithLinks.imageSeconds ?? 1,
          items: modelWithLinks.items ?? [],
          conditions: modelWithLinks.conditions ?? StorageConditionsModel(
              privilegeLevelRequired: PrivilegeLevelRequiredSimple
                  .NoPrivilegeRequiredSimple),
        );
      }
      yield FaderInitialised(model: modelWithLinks, );
      // 1. change fields and set error
      // 2. allow to update the image parameters.
    } else if (state is FaderInitialised) {
      var theState = state as FaderInitialised;
      if (event is NewImageEvent) {
        var newItem = ListedItemModel(
             documentID: newRandomKey(),
            description: '',
            action: null,
            image: event.medium,
            posSize: PosSizeModel(
                widthPortrait: 1,
                widthTypePortrait: WidthTypePortrait.PercentageWidth,
                heightPortrait: .5,
                heightTypePortrait: HeightTypePortrait.PercentageHeight,
                fitPortrait: PortraitFitType.PortraitFitWidth,
                alignTypePortrait: PortraitAlignType.PortraitAlignCenter,
                widthLandscape: 1,
                widthTypeLandscape: WidthTypeLandscape.PercentageWidth,
                heightLandscape: .5,
                heightTypeLandscape: HeightTypeLandscape.PercentageHeight,
                fitLandscape: LandscapeFitType.LandscapeFitHeight,
                alignTypeLandscape: LandscapeAlignType.LandscapeAlignCenter,
                clip: ClipType.NoClip),
        );
        theState.model.items!.add(newItem);
        var newModel = theState.model.copyWith(items: theState.model.items);
        yield FaderInitialised(model: newModel);
      } else if (event is SelectForEditEvent) {
        yield FaderInitialised(model: theState.model, currentEdit: event.listedItemModel);
      } else if (event is DeleteListedItemEvent) {
        var newListedItems = <ListedItemModel>[];
        for (var item in theState.model.items!) {
          if (item != event.listedItemModel) {
            newListedItems.add(item);
          }
        }
        yield FaderInitialised(
            model: theState.model.copyWith(items: newListedItems));
      } else if (event is UpdatedItemEvent) {
        var items = theState.model.items!;
        var index = items.indexOf(event.oldItem);
        if (index != -1) {
          var newListedItems = items.map((e) => e).toList();
          newListedItems[index] = event.newItem;
          yield FaderInitialised(
              model: theState.model.copyWith(items: newListedItems),
              currentEdit: event.newItem);
        }
      } else if (event is MoveEvent) {
        var items = theState.model.items!;
        var newListedItems = items.map((e) => e).toList();
        var index = items.indexOf(event.listedItemModel);
        if (index != -1) {
          if (event.isUp) {
            if (index > 0) {
              var old = newListedItems[index - 1];
              newListedItems[index - 1] = newListedItems[index];
              newListedItems[index] = old;
              yield FaderInitialised(
                  model: theState.model.copyWith(items: newListedItems), currentEdit: theState.currentEdit);
            }
          } else {
            if (index < newListedItems.length - 1) {
              var old = newListedItems[index + 1];
              newListedItems[index + 1] = newListedItems[index];
              newListedItems[index] = old;
              yield FaderInitialised(
                  model: theState.model.copyWith(items: newListedItems), currentEdit: theState.currentEdit);
            }
          }
        }
      }
    }
  }

  Future<void> save(FaderApplyChanges event) async {
    if (state is FaderInitialised) {
      var theState = state as FaderInitialised;
      var newModel = theState.model;
      if (await faderRepository(appId: appId)!
              .get(newModel.documentID!) ==
          null) {
        await faderRepository(appId: appId)!.add(newModel);
      } else {
        await faderRepository(appId: appId)!.update(newModel);
      }
      feedback(true);
    }
  }
}
