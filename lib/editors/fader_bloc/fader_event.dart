import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class FaderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FaderInitialise extends FaderEvent {
  final FaderModel model;

  FaderInitialise(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaderInitialise && model == other.model;
}

class FaderApplyChanges extends FaderEvent {
  final FaderModel model;

  FaderApplyChanges({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaderApplyChanges && model == other.model;
}

class NewImageEvent extends FaderEvent {
  final PlatformMediumModel medium;

  NewImageEvent({required this.medium});

  @override
  List<Object?> get props => [medium];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewImageEvent && medium == other.medium;
}

class DeleteListedItemEvent extends FaderEvent {
  final ListedItemModel listedItemModel;

  DeleteListedItemEvent({required this.listedItemModel});

  @override
  List<Object?> get props => [listedItemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteListedItemEvent &&
          listedItemModel == other.listedItemModel;
}

class SelectForEditEvent extends FaderEvent {
  final ListedItemModel listedItemModel;

  SelectForEditEvent({required this.listedItemModel});

  @override
  List<Object?> get props => [listedItemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectForEditEvent && listedItemModel == other.listedItemModel;
}

class MoveEvent extends FaderEvent {
  final bool isUp;
  final ListedItemModel listedItemModel;

  MoveEvent({required this.isUp, required this.listedItemModel});

  @override
  List<Object?> get props => [isUp, listedItemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoveEvent &&
          isUp == other.isUp &&
          listedItemModel == other.listedItemModel;
}

class UpdatedItemEvent extends FaderEvent {
  final ListedItemModel oldItem;
  final ListedItemModel newItem;

  UpdatedItemEvent({required this.oldItem, required this.newItem});

  @override
  List<Object?> get props => [oldItem, newItem];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdatedItemEvent &&
          oldItem == other.oldItem &&
          newItem == other.newItem;
}

class ChangedFaderName extends FaderEvent {
  final String value;

  ChangedFaderName({required this.value});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangedFaderName && value == other.value;
}
