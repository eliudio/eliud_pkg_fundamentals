/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';

abstract class DecoratedContentComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDecoratedContentComponent extends DecoratedContentComponentEvent {
  final String? id;

  FetchDecoratedContentComponent({this.id});
}

class DecoratedContentComponentUpdated extends DecoratedContentComponentEvent {
  final DecoratedContentModel value;

  DecoratedContentComponentUpdated({required this.value});
}
