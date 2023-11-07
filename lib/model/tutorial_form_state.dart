/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'tutorial_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TutorialFormState extends Equatable {
  const TutorialFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class TutorialFormUninitialized extends TutorialFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''TutorialFormState()''';
  }
}

// TutorialModel has been initialised and hence TutorialModel is available
class TutorialFormInitialized extends TutorialFormState {
  final TutorialModel? value;

  @override
  List<Object?> get props => [value];

  const TutorialFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class TutorialFormError extends TutorialFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const TutorialFormError({this.message, super.value});

  @override
  String toString() {
    return '''TutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDTutorialFormError extends TutorialFormError {
  const DocumentIDTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdTutorialFormError extends TutorialFormError {
  const AppIdTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameTutorialFormError extends TutorialFormError {
  const NameTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitleTutorialFormError extends TutorialFormError {
  const TitleTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitleTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionTutorialFormError extends TutorialFormError {
  const DescriptionTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TutorialEntriesTutorialFormError extends TutorialFormError {
  const TutorialEntriesTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TutorialEntriesTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsTutorialFormError extends TutorialFormError {
  const ConditionsTutorialFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsTutorialFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TutorialFormLoaded extends TutorialFormInitialized {
  const TutorialFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''TutorialFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableTutorialForm extends TutorialFormInitialized {
  const SubmittableTutorialForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableTutorialForm {
      value: $value,
    }''';
  }
}
