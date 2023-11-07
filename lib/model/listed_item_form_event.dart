/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

@immutable
abstract class ListedItemFormEvent extends Equatable {
  const ListedItemFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewListedItemFormEvent extends ListedItemFormEvent {}

class InitialiseListedItemFormEvent extends ListedItemFormEvent {
  final ListedItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseListedItemFormEvent({this.value});
}

class InitialiseListedItemFormNoLoadEvent extends ListedItemFormEvent {
  final ListedItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseListedItemFormNoLoadEvent({this.value});
}

class ChangedListedItemDocumentID extends ListedItemFormEvent {
  final String? value;

  ChangedListedItemDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedListedItemDocumentID{ value: $value }';
}

class ChangedListedItemDescription extends ListedItemFormEvent {
  final String? value;

  ChangedListedItemDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedListedItemDescription{ value: $value }';
}

class ChangedListedItemAction extends ListedItemFormEvent {
  final ActionModel? value;

  ChangedListedItemAction({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedListedItemAction{ value: $value }';
}

class ChangedListedItemImage extends ListedItemFormEvent {
  final String? value;

  ChangedListedItemImage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedListedItemImage{ value: $value }';
}

class ChangedListedItemPosSize extends ListedItemFormEvent {
  final PosSizeModel? value;

  ChangedListedItemPosSize({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedListedItemPosSize{ value: $value }';
}
