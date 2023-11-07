/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'link_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LinkFormState extends Equatable {
  const LinkFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class LinkFormUninitialized extends LinkFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''LinkFormState()''';
  }
}

// LinkModel has been initialised and hence LinkModel is available
class LinkFormInitialized extends LinkFormState {
  final LinkModel? value;

  @override
  List<Object?> get props => [value];

  const LinkFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class LinkFormError extends LinkFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const LinkFormError({this.message, super.value});

  @override
  String toString() {
    return '''LinkFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDLinkFormError extends LinkFormError {
  const DocumentIDLinkFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDLinkFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LinkTextLinkFormError extends LinkFormError {
  const LinkTextLinkFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''LinkTextLinkFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ActionLinkFormError extends LinkFormError {
  const ActionLinkFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ActionLinkFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LinkFormLoaded extends LinkFormInitialized {
  const LinkFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''LinkFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableLinkForm extends LinkFormInitialized {
  const SubmittableLinkForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableLinkForm {
      value: $value,
    }''';
  }
}
