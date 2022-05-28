/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dynamic_widget_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DynamicWidgetFormState extends Equatable {
  const DynamicWidgetFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DynamicWidgetFormUninitialized extends DynamicWidgetFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''DynamicWidgetFormState()''';
  }
}

// DynamicWidgetModel has been initialised and hence DynamicWidgetModel is available
class DynamicWidgetFormInitialized extends DynamicWidgetFormState {
  final DynamicWidgetModel? value;

  @override
  List<Object?> get props => [ value ];

  const DynamicWidgetFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class DynamicWidgetFormError extends DynamicWidgetFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const DynamicWidgetFormError({this.message, DynamicWidgetModel? value }) : super(value: value);

  @override
  String toString() {
    return '''DynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDDynamicWidgetFormError extends DynamicWidgetFormError { 
  const DocumentIDDynamicWidgetFormError({ String? message, DynamicWidgetModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDDynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdDynamicWidgetFormError extends DynamicWidgetFormError { 
  const AppIdDynamicWidgetFormError({ String? message, DynamicWidgetModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdDynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionDynamicWidgetFormError extends DynamicWidgetFormError { 
  const DescriptionDynamicWidgetFormError({ String? message, DynamicWidgetModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionDynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ContentDynamicWidgetFormError extends DynamicWidgetFormError { 
  const ContentDynamicWidgetFormError({ String? message, DynamicWidgetModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ContentDynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackgroundDynamicWidgetFormError extends DynamicWidgetFormError { 
  const BackgroundDynamicWidgetFormError({ String? message, DynamicWidgetModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BackgroundDynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsDynamicWidgetFormError extends DynamicWidgetFormError { 
  const ConditionsDynamicWidgetFormError({ String? message, DynamicWidgetModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsDynamicWidgetFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DynamicWidgetFormLoaded extends DynamicWidgetFormInitialized { 
  const DynamicWidgetFormLoaded({ DynamicWidgetModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''DynamicWidgetFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableDynamicWidgetForm extends DynamicWidgetFormInitialized { 
  const SubmittableDynamicWidgetForm({ DynamicWidgetModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableDynamicWidgetForm {
      value: $value,
    }''';
  }
}


