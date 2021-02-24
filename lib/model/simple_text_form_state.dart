/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'simple_text_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimpleTextFormState extends Equatable {
  const SimpleTextFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class SimpleTextFormUninitialized extends SimpleTextFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''SimpleTextFormState()''';
  }
}

// SimpleTextModel has been initialised and hence SimpleTextModel is available
class SimpleTextFormInitialized extends SimpleTextFormState {
  final SimpleTextModel value;

  @override
  List<Object> get props => [ value ];

  const SimpleTextFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class SimpleTextFormError extends SimpleTextFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const SimpleTextFormError({this.message, SimpleTextModel value }) : super(value: value);

  @override
  String toString() {
    return '''SimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDSimpleTextFormError extends SimpleTextFormError { 
  const DocumentIDSimpleTextFormError({ String message, SimpleTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDSimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdSimpleTextFormError extends SimpleTextFormError { 
  const AppIdSimpleTextFormError({ String message, SimpleTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdSimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleSimpleTextFormError extends SimpleTextFormError { 
  const TitleSimpleTextFormError({ String message, SimpleTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleSimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TextSimpleTextFormError extends SimpleTextFormError { 
  const TextSimpleTextFormError({ String message, SimpleTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TextSimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsSimpleTextFormError extends SimpleTextFormError { 
  const ConditionsSimpleTextFormError({ String message, SimpleTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsSimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TextAlignSimpleTextFormError extends SimpleTextFormError { 
  const TextAlignSimpleTextFormError({ String message, SimpleTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TextAlignSimpleTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SimpleTextFormLoaded extends SimpleTextFormInitialized { 
  const SimpleTextFormLoaded({ SimpleTextModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SimpleTextFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableSimpleTextForm extends SimpleTextFormInitialized { 
  const SubmittableSimpleTextForm({ SimpleTextModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableSimpleTextForm {
      value: $value,
    }''';
  }
}


