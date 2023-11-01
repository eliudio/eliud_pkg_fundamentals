/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';


@immutable
abstract class LinkFormEvent extends Equatable {
  const LinkFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewLinkFormEvent extends LinkFormEvent {
}


class InitialiseLinkFormEvent extends LinkFormEvent {
  final LinkModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseLinkFormEvent({this.value});
}

class InitialiseLinkFormNoLoadEvent extends LinkFormEvent {
  final LinkModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseLinkFormNoLoadEvent({this.value});
}

class ChangedLinkDocumentID extends LinkFormEvent {
  final String? value;

  ChangedLinkDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedLinkDocumentID{ value: $value }';
}

class ChangedLinkLinkText extends LinkFormEvent {
  final String? value;

  ChangedLinkLinkText({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedLinkLinkText{ value: $value }';
}

class ChangedLinkAction extends LinkFormEvent {
  final ActionModel? value;

  ChangedLinkAction({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedLinkAction{ value: $value }';
}

