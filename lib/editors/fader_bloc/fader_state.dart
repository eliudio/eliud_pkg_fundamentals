import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class FaderState extends Equatable {
  const FaderState();

  @override
  List<Object?> get props => [];
}

class FaderUninitialised extends FaderState {
  @override
  List<Object?> get props => [];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is FaderUninitialised;
}

class FaderInitialised extends FaderState {
  final FaderModel model;
  final ListedItemModel? currentEdit;

  const FaderInitialised({required this.model, this.currentEdit});

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is FaderInitialised &&
          model == other.model &&
              currentEdit == other.currentEdit;

  @override
  List<Object?> get props => [ model ];
}

class FaderLoaded extends FaderInitialised {
  const FaderLoaded({ required FaderModel model, ListedItemModel? currentEdit }): super(model: model, currentEdit: currentEdit);

}

class FaderError extends FaderInitialised {
  final String error;

  const FaderError({ required this.error, required FaderModel model, ListedItemModel? currentEdit  }): super(model: model, currentEdit: currentEdit);
}

