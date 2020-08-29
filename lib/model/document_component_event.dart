/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class DocumentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDocument extends DocumentEvent {
  final String id;

  FetchDocument({ this.id });
}

