/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';

abstract class PhotoAndTextComponentState extends Equatable {
  const PhotoAndTextComponentState();

  @override
  List<Object> get props => [];
}

class PhotoAndTextComponentUninitialized extends PhotoAndTextComponentState {}

class PhotoAndTextComponentError extends PhotoAndTextComponentState {
  final String message;
  PhotoAndTextComponentError({ this.message });
}

class PhotoAndTextComponentPermissionDenied extends PhotoAndTextComponentState {
  PhotoAndTextComponentPermissionDenied();
}

class PhotoAndTextComponentLoaded extends PhotoAndTextComponentState {
  final PhotoAndTextModel value;

  const PhotoAndTextComponentLoaded({ this.value });

  PhotoAndTextComponentLoaded copyWith({ PhotoAndTextModel copyThis }) {
    return PhotoAndTextComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PhotoAndTextComponentLoaded { value: $value }';
}

