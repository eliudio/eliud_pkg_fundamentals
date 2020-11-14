/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';

abstract class BookletComponentState extends Equatable {
  const BookletComponentState();

  @override
  List<Object> get props => [];
}

class BookletComponentUninitialized extends BookletComponentState {}

class BookletComponentError extends BookletComponentState {
  final String message;
  BookletComponentError({ this.message });
}

class BookletComponentLoaded extends BookletComponentState {
  final BookletModel value;

  const BookletComponentLoaded({ this.value });

  BookletComponentLoaded copyWith({ BookletModel copyThis }) {
    return BookletComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'BookletComponentLoaded { value: $value }';
}


