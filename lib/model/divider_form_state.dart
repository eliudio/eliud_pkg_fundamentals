/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'divider_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DividerFormState extends Equatable {
  const DividerFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DividerFormUninitialized extends DividerFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''DividerFormState()''';
  }
}

// DividerModel has been initialised and hence DividerModel is available
class DividerFormInitialized extends DividerFormState {
  final DividerModel? value;

  @override
  List<Object?> get props => [ value ];

  const DividerFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class DividerFormError extends DividerFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const DividerFormError({this.message, DividerModel? value }) : super(value: value);

  @override
  String toString() {
    return '''DividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDDividerFormError extends DividerFormError { 
  const DocumentIDDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdDividerFormError extends DividerFormError { 
  const AppIdDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameDividerFormError extends DividerFormError { 
  const NameDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NameDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ColorDividerFormError extends DividerFormError { 
  const ColorDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ColorDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeightDividerFormError extends DividerFormError { 
  const HeightDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeightDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ThicknessDividerFormError extends DividerFormError { 
  const ThicknessDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ThicknessDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class IndentDividerFormError extends DividerFormError { 
  const IndentDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''IndentDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class EndIndentDividerFormError extends DividerFormError { 
  const EndIndentDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''EndIndentDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsDividerFormError extends DividerFormError { 
  const ConditionsDividerFormError({ String? message, DividerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsDividerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DividerFormLoaded extends DividerFormInitialized { 
  const DividerFormLoaded({ DividerModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''DividerFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableDividerForm extends DividerFormInitialized { 
  const SubmittableDividerForm({ DividerModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableDividerForm {
      value: $value,
    }''';
  }
}


