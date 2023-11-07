/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'presentation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PresentationFormState extends Equatable {
  const PresentationFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PresentationFormUninitialized extends PresentationFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PresentationFormState()''';
  }
}

// PresentationModel has been initialised and hence PresentationModel is available
class PresentationFormInitialized extends PresentationFormState {
  final PresentationModel? value;

  @override
  List<Object?> get props => [value];

  const PresentationFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PresentationFormError extends PresentationFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PresentationFormError({this.message, super.value});

  @override
  String toString() {
    return '''PresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPresentationFormError extends PresentationFormError {
  const DocumentIDPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPresentationFormError extends PresentationFormError {
  const AppIdPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionPresentationFormError extends PresentationFormError {
  const DescriptionPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BodyComponentsPresentationFormError extends PresentationFormError {
  const BodyComponentsPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BodyComponentsPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImagePresentationFormError extends PresentationFormError {
  const ImagePresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImagePresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImagePositionRelativePresentationFormError extends PresentationFormError {
  const ImagePositionRelativePresentationFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImagePositionRelativePresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageAlignmentPresentationFormError extends PresentationFormError {
  const ImageAlignmentPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageAlignmentPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageWidthPresentationFormError extends PresentationFormError {
  const ImageWidthPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageWidthPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsPresentationFormError extends PresentationFormError {
  const ConditionsPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PresentationFormLoaded extends PresentationFormInitialized {
  const PresentationFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PresentationFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePresentationForm extends PresentationFormInitialized {
  const SubmittablePresentationForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePresentationForm {
      value: $value,
    }''';
  }
}
