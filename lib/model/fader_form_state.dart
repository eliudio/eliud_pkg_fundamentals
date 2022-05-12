/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'fader_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FaderFormState extends Equatable {
  const FaderFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FaderFormUninitialized extends FaderFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''FaderFormState()''';
  }
}

// FaderModel has been initialised and hence FaderModel is available
class FaderFormInitialized extends FaderFormState {
  final FaderModel? value;

  @override
  List<Object?> get props => [ value ];

  const FaderFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class FaderFormError extends FaderFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const FaderFormError({this.message, FaderModel? value }) : super(value: value);

  @override
  String toString() {
    return '''FaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDFaderFormError extends FaderFormError { 
  const DocumentIDFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdFaderFormError extends FaderFormError { 
  const AppIdFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionFaderFormError extends FaderFormError { 
  const DescriptionFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AnimationMillisecondsFaderFormError extends FaderFormError { 
  const AnimationMillisecondsFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AnimationMillisecondsFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageSecondsFaderFormError extends FaderFormError { 
  const ImageSecondsFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ImageSecondsFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ItemsFaderFormError extends FaderFormError { 
  const ItemsFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ItemsFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsFaderFormError extends FaderFormError { 
  const ConditionsFaderFormError({ String? message, FaderModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsFaderFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FaderFormLoaded extends FaderFormInitialized { 
  const FaderFormLoaded({ FaderModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''FaderFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableFaderForm extends FaderFormInitialized { 
  const SubmittableFaderForm({ FaderModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableFaderForm {
      value: $value,
    }''';
  }
}


