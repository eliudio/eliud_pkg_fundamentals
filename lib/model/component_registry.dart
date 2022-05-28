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
import 'package:eliud_pkg_fundamentals/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_fundamentals', ["booklets", "decoratedContents", "dividers", "documents", "dynamicWidgets", "faders", "grids", "presentations", "simpleImages", "simpleTexts", "tutorials", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_fundamentals_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("booklets", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "booklets", componentConstructor: BookletComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("decoratedContents", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "decoratedContents", componentConstructor: DecoratedContentComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("dividers", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "dividers", componentConstructor: DividerComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("documents", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "documents", componentConstructor: DocumentComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("dynamicWidgets", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "dynamicWidgets", componentConstructor: DynamicWidgetComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("faders", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "faders", componentConstructor: FaderComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("grids", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "grids", componentConstructor: GridComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("presentations", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "presentations", componentConstructor: PresentationComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("simpleImages", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "simpleImages", componentConstructor: SimpleImageComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("simpleTexts", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "simpleTexts", componentConstructor: SimpleTextComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("tutorials", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "tutorials", componentConstructor: TutorialComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_pkg_fundamentals', 'fundamentals', [
      ComponentSpec('booklets', BookletComponentConstructorDefault(), BookletComponentSelector(), BookletComponentEditorConstructor(), ), 
      ComponentSpec('decoratedContents', DecoratedContentComponentConstructorDefault(), DecoratedContentComponentSelector(), DecoratedContentComponentEditorConstructor(), ), 
      ComponentSpec('dividers', DividerComponentConstructorDefault(), DividerComponentSelector(), DividerComponentEditorConstructor(), ), 
      ComponentSpec('documents', DocumentComponentConstructorDefault(), DocumentComponentSelector(), DocumentComponentEditorConstructor(), ), 
      ComponentSpec('dynamicWidgets', DynamicWidgetComponentConstructorDefault(), DynamicWidgetComponentSelector(), DynamicWidgetComponentEditorConstructor(), ), 
      ComponentSpec('faders', FaderComponentConstructorDefault(), FaderComponentSelector(), FaderComponentEditorConstructor(), ), 
      ComponentSpec('grids', GridComponentConstructorDefault(), GridComponentSelector(), GridComponentEditorConstructor(), ), 
      ComponentSpec('presentations', PresentationComponentConstructorDefault(), PresentationComponentSelector(), PresentationComponentEditorConstructor(), ), 
      ComponentSpec('simpleImages', SimpleImageComponentConstructorDefault(), SimpleImageComponentSelector(), SimpleImageComponentEditorConstructor(), ), 
      ComponentSpec('simpleTexts', SimpleTextComponentConstructorDefault(), SimpleTextComponentSelector(), SimpleTextComponentEditorConstructor(), ), 
      ComponentSpec('tutorials', TutorialComponentConstructorDefault(), TutorialComponentSelector(), TutorialComponentEditorConstructor(), ), 
    ]);

  }
}


