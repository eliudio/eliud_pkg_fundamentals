/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'listed_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListedItemFormState extends Equatable {
  const ListedItemFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ListedItemFormUninitialized extends ListedItemFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ListedItemFormState()''';
  }
}

// ListedItemModel has been initialised and hence ListedItemModel is available
class ListedItemFormInitialized extends ListedItemFormState {
  final ListedItemModel? value;

  @override
  List<Object?> get props => [value];

  const ListedItemFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ListedItemFormError extends ListedItemFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ListedItemFormError({this.message, super.value});

  @override
  String toString() {
    return '''ListedItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDListedItemFormError extends ListedItemFormError {
  const DocumentIDListedItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDListedItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionListedItemFormError extends ListedItemFormError {
  const DescriptionListedItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionListedItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ActionListedItemFormError extends ListedItemFormError {
  const ActionListedItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ActionListedItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageListedItemFormError extends ListedItemFormError {
  const ImageListedItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageListedItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PosSizeListedItemFormError extends ListedItemFormError {
  const PosSizeListedItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PosSizeListedItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ListedItemFormLoaded extends ListedItemFormInitialized {
  const ListedItemFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ListedItemFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableListedItemForm extends ListedItemFormInitialized {
  const SubmittableListedItemForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableListedItemForm {
      value: $value,
    }''';
  }
}
