/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'booklet_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookletFormState extends Equatable {
  const BookletFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class BookletFormUninitialized extends BookletFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''BookletFormState()''';
  }
}

// BookletModel has been initialised and hence BookletModel is available
class BookletFormInitialized extends BookletFormState {
  final BookletModel? value;

  @override
  List<Object?> get props => [ value ];

  const BookletFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class BookletFormError extends BookletFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const BookletFormError({this.message, BookletModel? value }) : super(value: value);

  @override
  String toString() {
    return '''BookletFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDBookletFormError extends BookletFormError { 
  const DocumentIDBookletFormError({ String? message, BookletModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDBookletFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdBookletFormError extends BookletFormError { 
  const AppIdBookletFormError({ String? message, BookletModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdBookletFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameBookletFormError extends BookletFormError { 
  const NameBookletFormError({ String? message, BookletModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NameBookletFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SectionsBookletFormError extends BookletFormError { 
  const SectionsBookletFormError({ String? message, BookletModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''SectionsBookletFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsBookletFormError extends BookletFormError { 
  const ConditionsBookletFormError({ String? message, BookletModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsBookletFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BookletFormLoaded extends BookletFormInitialized { 
  const BookletFormLoaded({ BookletModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''BookletFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableBookletForm extends BookletFormInitialized { 
  const SubmittableBookletForm({ BookletModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableBookletForm {
      value: $value,
    }''';
  }
}


