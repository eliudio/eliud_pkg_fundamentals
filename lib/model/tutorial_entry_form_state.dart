/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'tutorial_entry_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TutorialEntryFormState extends Equatable {
  const TutorialEntryFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class TutorialEntryFormUninitialized extends TutorialEntryFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''TutorialEntryFormState()''';
  }
}

// TutorialEntryModel has been initialised and hence TutorialEntryModel is available
class TutorialEntryFormInitialized extends TutorialEntryFormState {
  final TutorialEntryModel? value;

  @override
  List<Object?> get props => [value];

  const TutorialEntryFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class TutorialEntryFormError extends TutorialEntryFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const TutorialEntryFormError({this.message, super.value});

  @override
  String toString() {
    return '''TutorialEntryFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDTutorialEntryFormError extends TutorialEntryFormError {
  const DocumentIDTutorialEntryFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDTutorialEntryFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionTutorialEntryFormError extends TutorialEntryFormError {
  const DescriptionTutorialEntryFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionTutorialEntryFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageTutorialEntryFormError extends TutorialEntryFormError {
  const ImageTutorialEntryFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageTutorialEntryFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CodeTutorialEntryFormError extends TutorialEntryFormError {
  const CodeTutorialEntryFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CodeTutorialEntryFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TutorialEntryFormLoaded extends TutorialEntryFormInitialized {
  const TutorialEntryFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''TutorialEntryFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableTutorialEntryForm extends TutorialEntryFormInitialized {
  const SubmittableTutorialEntryForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableTutorialEntryForm {
      value: $value,
    }''';
  }
}
