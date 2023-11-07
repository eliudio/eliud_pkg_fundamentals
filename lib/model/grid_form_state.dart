/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'grid_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GridFormState extends Equatable {
  const GridFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class GridFormUninitialized extends GridFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''GridFormState()''';
  }
}

// GridModel has been initialised and hence GridModel is available
class GridFormInitialized extends GridFormState {
  final GridModel? value;

  @override
  List<Object?> get props => [value];

  const GridFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class GridFormError extends GridFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const GridFormError({this.message, super.value});

  @override
  String toString() {
    return '''GridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDGridFormError extends GridFormError {
  const DocumentIDGridFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdGridFormError extends GridFormError {
  const AppIdGridFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionGridFormError extends GridFormError {
  const DescriptionGridFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BodyComponentsGridFormError extends GridFormError {
  const BodyComponentsGridFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BodyComponentsGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class GridViewGridFormError extends GridFormError {
  const GridViewGridFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''GridViewGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsGridFormError extends GridFormError {
  const ConditionsGridFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class GridFormLoaded extends GridFormInitialized {
  const GridFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''GridFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableGridForm extends GridFormInitialized {
  const SubmittableGridForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableGridForm {
      value: $value,
    }''';
  }
}
