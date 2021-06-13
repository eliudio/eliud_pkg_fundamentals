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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'grid_model.dart';

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
  List<Object?> get props => [ value ];

  const GridFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class GridFormError extends GridFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const GridFormError({this.message, GridModel? value }) : super(value: value);

  @override
  String toString() {
    return '''GridFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDGridFormError extends GridFormError { 
  const DocumentIDGridFormError({ String? message, GridModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdGridFormError extends GridFormError { 
  const AppIdGridFormError({ String? message, GridModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleGridFormError extends GridFormError { 
  const TitleGridFormError({ String? message, GridModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BodyComponentsGridFormError extends GridFormError { 
  const BodyComponentsGridFormError({ String? message, GridModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BodyComponentsGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class GridViewGridFormError extends GridFormError { 
  const GridViewGridFormError({ String? message, GridModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''GridViewGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsGridFormError extends GridFormError { 
  const ConditionsGridFormError({ String? message, GridModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsGridFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class GridFormLoaded extends GridFormInitialized { 
  const GridFormLoaded({ GridModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''GridFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableGridForm extends GridFormInitialized { 
  const SubmittableGridForm({ GridModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableGridForm {
      value: $value,
    }''';
  }
}


