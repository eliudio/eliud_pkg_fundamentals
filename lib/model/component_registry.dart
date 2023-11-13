/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';

import '../extensions/booklet_component.dart';
import '../editors/booklet_component_editor.dart';
import 'booklet_component_selector.dart';
import '../extensions/decorated_content_component.dart';
import '../editors/decorated_content_component_editor.dart';
import 'decorated_content_component_selector.dart';
import '../extensions/divider_component.dart';
import '../editors/divider_component_editor.dart';
import 'divider_component_selector.dart';
import '../extensions/document_component.dart';
import '../editors/document_component_editor.dart';
import 'document_component_selector.dart';
import '../extensions/dynamic_widget_component.dart';
import '../editors/dynamic_widget_component_editor.dart';
import 'dynamic_widget_component_selector.dart';
import '../extensions/fader_component.dart';
import '../editors/fader_component_editor.dart';
import 'fader_component_selector.dart';
import '../extensions/grid_component.dart';
import '../editors/grid_component_editor.dart';
import 'grid_component_selector.dart';
import '../extensions/presentation_component.dart';
import '../editors/presentation_component_editor.dart';
import 'presentation_component_selector.dart';
import '../extensions/simple_image_component.dart';
import '../editors/simple_image_component_editor.dart';
import 'simple_image_component_selector.dart';
import '../extensions/simple_text_component.dart';
import '../editors/simple_text_component_editor.dart';
import 'simple_text_component_selector.dart';
import '../extensions/tutorial_component.dart';
import '../editors/tutorial_component_editor.dart';
import 'tutorial_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_fundamentals', [
      "booklets",
      "decoratedContents",
      "dividers",
      "documents",
      "dynamicWidgets",
      "faders",
      "grids",
      "presentations",
      "simpleImages",
      "simpleTexts",
      "tutorials",
    ]);

    Registry.registry()!.register(
        componentName: "eliud_pkg_fundamentals_internalWidgets",
        componentConstructor: ListComponentFactory());
    Registry.registry()!
        .addDropDownSupporter("booklets", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "booklets",
        componentConstructor: BookletComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter(
        "decoratedContents", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "decoratedContents",
        componentConstructor: DecoratedContentComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("dividers", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "dividers",
        componentConstructor: DividerComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("documents", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "documents",
        componentConstructor: DocumentComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter(
        "dynamicWidgets", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "dynamicWidgets",
        componentConstructor: DynamicWidgetComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("faders", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "faders",
        componentConstructor: FaderComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("grids", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "grids",
        componentConstructor: GridComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter(
        "presentations", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "presentations",
        componentConstructor: PresentationComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("simpleImages", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "simpleImages",
        componentConstructor: SimpleImageComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("simpleTexts", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "simpleTexts",
        componentConstructor: SimpleTextComponentConstructorDefault());
    Registry.registry()!
        .addDropDownSupporter("tutorials", DropdownButtonComponentFactory());
    Registry.registry()!.register(
        componentName: "tutorials",
        componentConstructor: TutorialComponentConstructorDefault());
    Registry.registry()!
        .addComponentSpec('eliud_pkg_fundamentals', 'fundamentals', [
      ComponentSpec(
          'booklets',
          BookletComponentConstructorDefault(),
          BookletComponentSelector(),
          BookletComponentEditorConstructor(),
          ({String? appId}) => bookletRepository(appId: appId)!),
      ComponentSpec(
          'decoratedContents',
          DecoratedContentComponentConstructorDefault(),
          DecoratedContentComponentSelector(),
          DecoratedContentComponentEditorConstructor(),
          ({String? appId}) => decoratedContentRepository(appId: appId)!),
      ComponentSpec(
          'dividers',
          DividerComponentConstructorDefault(),
          DividerComponentSelector(),
          DividerComponentEditorConstructor(),
          ({String? appId}) => dividerRepository(appId: appId)!),
      ComponentSpec(
          'documents',
          DocumentComponentConstructorDefault(),
          DocumentComponentSelector(),
          DocumentComponentEditorConstructor(),
          ({String? appId}) => documentRepository(appId: appId)!),
      ComponentSpec(
          'dynamicWidgets',
          DynamicWidgetComponentConstructorDefault(),
          DynamicWidgetComponentSelector(),
          DynamicWidgetComponentEditorConstructor(),
          ({String? appId}) => dynamicWidgetRepository(appId: appId)!),
      ComponentSpec(
          'faders',
          FaderComponentConstructorDefault(),
          FaderComponentSelector(),
          FaderComponentEditorConstructor(),
          ({String? appId}) => faderRepository(appId: appId)!),
      ComponentSpec(
          'grids',
          GridComponentConstructorDefault(),
          GridComponentSelector(),
          GridComponentEditorConstructor(),
          ({String? appId}) => gridRepository(appId: appId)!),
      ComponentSpec(
          'presentations',
          PresentationComponentConstructorDefault(),
          PresentationComponentSelector(),
          PresentationComponentEditorConstructor(),
          ({String? appId}) => presentationRepository(appId: appId)!),
      ComponentSpec(
          'simpleImages',
          SimpleImageComponentConstructorDefault(),
          SimpleImageComponentSelector(),
          SimpleImageComponentEditorConstructor(),
          ({String? appId}) => simpleImageRepository(appId: appId)!),
      ComponentSpec(
          'simpleTexts',
          SimpleTextComponentConstructorDefault(),
          SimpleTextComponentSelector(),
          SimpleTextComponentEditorConstructor(),
          ({String? appId}) => simpleTextRepository(appId: appId)!),
      ComponentSpec(
          'tutorials',
          TutorialComponentConstructorDefault(),
          TutorialComponentSelector(),
          TutorialComponentEditorConstructor(),
          ({String? appId}) => tutorialRepository(appId: appId)!),
    ]);
    Registry.registry()!.registerRetrieveRepository('eliud_pkg_fundamentals',
        'booklets', ({String? appId}) => bookletRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository(
        'eliud_pkg_fundamentals',
        'decoratedContents',
        ({String? appId}) => decoratedContentRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository('eliud_pkg_fundamentals',
        'dividers', ({String? appId}) => dividerRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository('eliud_pkg_fundamentals',
        'documents', ({String? appId}) => documentRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository(
        'eliud_pkg_fundamentals',
        'dynamicWidgets',
        ({String? appId}) => dynamicWidgetRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository('eliud_pkg_fundamentals',
        'faders', ({String? appId}) => faderRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository('eliud_pkg_fundamentals',
        'grids', ({String? appId}) => gridRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository(
        'eliud_pkg_fundamentals',
        'presentations',
        ({String? appId}) => presentationRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository(
        'eliud_pkg_fundamentals',
        'simpleImages',
        ({String? appId}) => simpleImageRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository(
        'eliud_pkg_fundamentals',
        'simpleTexts',
        ({String? appId}) => simpleTextRepository(appId: appId)!);
    Registry.registry()!.registerRetrieveRepository('eliud_pkg_fundamentals',
        'tutorials', ({String? appId}) => tutorialRepository(appId: appId)!);
  }
}
