/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';

abstract class BookletComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBookletComponent extends BookletComponentEvent {
  final String? id;

  FetchBookletComponent({this.id});
}

class BookletComponentUpdated extends BookletComponentEvent {
  final BookletModel value;

  BookletComponentUpdated({required this.value});
}
