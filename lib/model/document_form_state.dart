/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'document_model.dart';

@immutable
abstract class DocumentFormState extends Equatable {
  const DocumentFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DocumentFormUninitialized extends DocumentFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''DocumentFormState()''';
  }
}

// DocumentModel has been initialised and hence DocumentModel is available
class DocumentFormInitialized extends DocumentFormState {
  final DocumentModel? value;

  @override
  List<Object?> get props => [ value ];

  const DocumentFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class DocumentFormError extends DocumentFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const DocumentFormError({this.message, DocumentModel? value }) : super(value: value);

  @override
  String toString() {
    return '''DocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDDocumentFormError extends DocumentFormError { 
  const DocumentIDDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdDocumentFormError extends DocumentFormError { 
  const AppIdDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameDocumentFormError extends DocumentFormError { 
  const NameDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NameDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DocumentRendererDocumentFormError extends DocumentFormError { 
  const DocumentRendererDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentRendererDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ContentDocumentFormError extends DocumentFormError { 
  const ContentDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ContentDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PaddingDocumentFormError extends DocumentFormError { 
  const PaddingDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''PaddingDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImagesDocumentFormError extends DocumentFormError { 
  const ImagesDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ImagesDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackgroundDocumentFormError extends DocumentFormError { 
  const BackgroundDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BackgroundDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsDocumentFormError extends DocumentFormError { 
  const ConditionsDocumentFormError({ String? message, DocumentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsDocumentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DocumentFormLoaded extends DocumentFormInitialized { 
  const DocumentFormLoaded({ DocumentModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''DocumentFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableDocumentForm extends DocumentFormInitialized { 
  const SubmittableDocumentForm({ DocumentModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableDocumentForm {
      value: $value,
    }''';
  }
}


