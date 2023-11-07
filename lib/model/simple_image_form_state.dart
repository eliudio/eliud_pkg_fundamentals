/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'simple_image_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimpleImageFormState extends Equatable {
  const SimpleImageFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class SimpleImageFormUninitialized extends SimpleImageFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''SimpleImageFormState()''';
  }
}

// SimpleImageModel has been initialised and hence SimpleImageModel is available
class SimpleImageFormInitialized extends SimpleImageFormState {
  final SimpleImageModel? value;

  @override
  List<Object?> get props => [value];

  const SimpleImageFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class SimpleImageFormError extends SimpleImageFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const SimpleImageFormError({this.message, super.value});

  @override
  String toString() {
    return '''SimpleImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDSimpleImageFormError extends SimpleImageFormError {
  const DocumentIDSimpleImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDSimpleImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdSimpleImageFormError extends SimpleImageFormError {
  const AppIdSimpleImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdSimpleImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionSimpleImageFormError extends SimpleImageFormError {
  const DescriptionSimpleImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionSimpleImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageSimpleImageFormError extends SimpleImageFormError {
  const ImageSimpleImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageSimpleImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsSimpleImageFormError extends SimpleImageFormError {
  const ConditionsSimpleImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsSimpleImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SimpleImageFormLoaded extends SimpleImageFormInitialized {
  const SimpleImageFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SimpleImageFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableSimpleImageForm extends SimpleImageFormInitialized {
  const SubmittableSimpleImageForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableSimpleImageForm {
      value: $value,
    }''';
  }
}
