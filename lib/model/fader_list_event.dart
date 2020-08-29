/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'fader_model.dart';

abstract class FaderListEvent extends Equatable {
  const FaderListEvent();
  @override
  List<Object> get props => [];
}

class LoadFaderList extends FaderListEvent {}
class LoadFaderListWithDetails extends FaderListEvent {}

class AddFaderList extends FaderListEvent {
  final FaderModel value;

  const AddFaderList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddFaderList{ value: $value }';
}

class UpdateFaderList extends FaderListEvent {
  final FaderModel value;

  const UpdateFaderList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateFaderList{ value: $value }';
}

class DeleteFaderList extends FaderListEvent {
  final FaderModel value;

  const DeleteFaderList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteFaderList{ value: $value }';
}

class FaderListUpdated extends FaderListEvent {
  final List<FaderModel> value;

  const FaderListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'FaderListUpdated{ value: $value }';
}

