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

abstract class BookletState extends Equatable {
  const BookletState();

  @override
  List<Object> get props => [];
}

class BookletUninitialized extends BookletState {}

class BookletError extends BookletState {
  final String message;
  BookletError({ this.message });
}

class BookletLoaded extends BookletState {
  final BookletModel value;

  const BookletLoaded({ this.value });

  BookletLoaded copyWith({ BookletModel copyThis }) {
    return BookletLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'BookletModelLoaded { value: $value }';
}


