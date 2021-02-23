/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'photo_and_text_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoAndTextFormState extends Equatable {
  const PhotoAndTextFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PhotoAndTextFormUninitialized extends PhotoAndTextFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''PhotoAndTextFormState()''';
  }
}

// PhotoAndTextModel has been initialised and hence PhotoAndTextModel is available
class PhotoAndTextFormInitialized extends PhotoAndTextFormState {
  final PhotoAndTextModel value;

  @override
  List<Object> get props => [ value ];

  const PhotoAndTextFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class PhotoAndTextFormError extends PhotoAndTextFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const PhotoAndTextFormError({this.message, PhotoAndTextModel value }) : super(value: value);

  @override
  String toString() {
    return '''PhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDPhotoAndTextFormError extends PhotoAndTextFormError { 
  const DocumentIDPhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDPhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdPhotoAndTextFormError extends PhotoAndTextFormError { 
  const AppIdPhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdPhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NamePhotoAndTextFormError extends PhotoAndTextFormError { 
  const NamePhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''NamePhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitlePhotoAndTextFormError extends PhotoAndTextFormError { 
  const TitlePhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitlePhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ContentsPhotoAndTextFormError extends PhotoAndTextFormError { 
  const ContentsPhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ContentsPhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImagePhotoAndTextFormError extends PhotoAndTextFormError { 
  const ImagePhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ImagePhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImagePositionPhotoAndTextFormError extends PhotoAndTextFormError { 
  const ImagePositionPhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ImagePositionPhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PercentageImageVisiblePhotoAndTextFormError extends PhotoAndTextFormError { 
  const PercentageImageVisiblePhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''PercentageImageVisiblePhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsPhotoAndTextFormError extends PhotoAndTextFormError { 
  const ConditionsPhotoAndTextFormError({ String message, PhotoAndTextModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsPhotoAndTextFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PhotoAndTextFormLoaded extends PhotoAndTextFormInitialized { 
  const PhotoAndTextFormLoaded({ PhotoAndTextModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''PhotoAndTextFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittablePhotoAndTextForm extends PhotoAndTextFormInitialized { 
  const SubmittablePhotoAndTextForm({ PhotoAndTextModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittablePhotoAndTextForm {
      value: $value,
    }''';
  }
}


