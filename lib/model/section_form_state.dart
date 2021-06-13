/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'section_model.dart';

@immutable
abstract class SectionFormState extends Equatable {
  const SectionFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class SectionFormUninitialized extends SectionFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''SectionFormState()''';
  }
}

// SectionModel has been initialised and hence SectionModel is available
class SectionFormInitialized extends SectionFormState {
  final SectionModel? value;

  @override
  List<Object?> get props => [ value ];

  const SectionFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class SectionFormError extends SectionFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const SectionFormError({this.message, SectionModel? value }) : super(value: value);

  @override
  String toString() {
    return '''SectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDSectionFormError extends SectionFormError { 
  const DocumentIDSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleSectionFormError extends SectionFormError { 
  const TitleSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionSectionFormError extends SectionFormError { 
  const DescriptionSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageSectionFormError extends SectionFormError { 
  const ImageSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ImageSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImagePositionRelativeSectionFormError extends SectionFormError { 
  const ImagePositionRelativeSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ImagePositionRelativeSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageAlignmentSectionFormError extends SectionFormError { 
  const ImageAlignmentSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ImageAlignmentSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageWidthSectionFormError extends SectionFormError { 
  const ImageWidthSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ImageWidthSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class LinksSectionFormError extends SectionFormError { 
  const LinksSectionFormError({ String? message, SectionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''LinksSectionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SectionFormLoaded extends SectionFormInitialized { 
  const SectionFormLoaded({ SectionModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SectionFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableSectionForm extends SectionFormInitialized { 
  const SubmittableSectionForm({ SectionModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableSectionForm {
      value: $value,
    }''';
  }
}


