/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'document_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DocumentItemFormState extends Equatable {
  const DocumentItemFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DocumentItemFormUninitialized extends DocumentItemFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''DocumentItemFormState()''';
  }
}

// DocumentItemModel has been initialised and hence DocumentItemModel is available
class DocumentItemFormInitialized extends DocumentItemFormState {
  final DocumentItemModel? value;

  @override
  List<Object?> get props => [value];

  const DocumentItemFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class DocumentItemFormError extends DocumentItemFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const DocumentItemFormError({this.message, super.value});

  @override
  String toString() {
    return '''DocumentItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDDocumentItemFormError extends DocumentItemFormError {
  const DocumentIDDocumentItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDDocumentItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ReferenceDocumentItemFormError extends DocumentItemFormError {
  const ReferenceDocumentItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ReferenceDocumentItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageDocumentItemFormError extends DocumentItemFormError {
  const ImageDocumentItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageDocumentItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentItemFormLoaded extends DocumentItemFormInitialized {
  const DocumentItemFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''DocumentItemFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableDocumentItemForm extends DocumentItemFormInitialized {
  const SubmittableDocumentItemForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableDocumentItemForm {
      value: $value,
    }''';
  }
}
