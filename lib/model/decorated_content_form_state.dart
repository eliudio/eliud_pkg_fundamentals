/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'decorated_content_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DecoratedContentFormState extends Equatable {
  const DecoratedContentFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DecoratedContentFormUninitialized extends DecoratedContentFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''DecoratedContentFormState()''';
  }
}

// DecoratedContentModel has been initialised and hence DecoratedContentModel is available
class DecoratedContentFormInitialized extends DecoratedContentFormState {
  final DecoratedContentModel? value;

  @override
  List<Object?> get props => [value];

  const DecoratedContentFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class DecoratedContentFormError
    extends DecoratedContentFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const DecoratedContentFormError({this.message, super.value});

  @override
  String toString() {
    return '''DecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDDecoratedContentFormError extends DecoratedContentFormError {
  const DocumentIDDecoratedContentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdDecoratedContentFormError extends DecoratedContentFormError {
  const AppIdDecoratedContentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionDecoratedContentFormError extends DecoratedContentFormError {
  const DescriptionDecoratedContentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DecoratingComponentNameDecoratedContentFormError
    extends DecoratedContentFormError {
  const DecoratingComponentNameDecoratedContentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DecoratingComponentNameDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DecoratingComponentIdDecoratedContentFormError
    extends DecoratedContentFormError {
  const DecoratingComponentIdDecoratedContentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DecoratingComponentIdDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ContentComponentNameDecoratedContentFormError
    extends DecoratedContentFormError {
  const ContentComponentNameDecoratedContentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ContentComponentNameDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ContentComponentIdDecoratedContentFormError
    extends DecoratedContentFormError {
  const ContentComponentIdDecoratedContentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ContentComponentIdDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DecorationComponentPositionDecoratedContentFormError
    extends DecoratedContentFormError {
  const DecorationComponentPositionDecoratedContentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DecorationComponentPositionDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PercentageDecorationVisibleDecoratedContentFormError
    extends DecoratedContentFormError {
  const PercentageDecorationVisibleDecoratedContentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PercentageDecorationVisibleDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsDecoratedContentFormError extends DecoratedContentFormError {
  const ConditionsDecoratedContentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsDecoratedContentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DecoratedContentFormLoaded extends DecoratedContentFormInitialized {
  const DecoratedContentFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''DecoratedContentFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableDecoratedContentForm extends DecoratedContentFormInitialized {
  const SubmittableDecoratedContentForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableDecoratedContentForm {
      value: $value,
    }''';
  }
}
