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
import 'package:eliud_core/tools/registry.dart';

import '../extensions/booklet_component.dart';
import '../extensions/divider_component.dart';
import '../extensions/document_component.dart';
import '../extensions/fader_component.dart';
import '../extensions/grid_component.dart';
import '../extensions/play_store_component.dart';
import '../extensions/presentation_component.dart';
import '../extensions/simple_image_component.dart';
import '../extensions/tutorial_component.dart';
import '../extensions/photo_and_text_component.dart';
import 'package:eliud_pkg_fundamentals/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry().addInternalComponents('eliud_pkg_fundamentals', ["booklets", "dividers", "documents", "faders", "grids", "playStores", "presentations", "simpleImages", "tutorials", "photoAndTexts", ]);

    Registry.registry().register(componentName: "eliud_pkg_fundamentals_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry().addDropDownSupporter("booklets", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "booklets", componentConstructor: BookletComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("dividers", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "dividers", componentConstructor: DividerComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("documents", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "documents", componentConstructor: DocumentComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("faders", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "faders", componentConstructor: FaderComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("grids", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "grids", componentConstructor: GridComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("playStores", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "playStores", componentConstructor: PlayStoreComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("presentations", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "presentations", componentConstructor: PresentationComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("simpleImages", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "simpleImages", componentConstructor: SimpleImageComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("tutorials", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "tutorials", componentConstructor: TutorialComponentConstructorDefault());
    Registry.registry().addDropDownSupporter("photoAndTexts", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "photoAndTexts", componentConstructor: PhotoAndTextComponentConstructorDefault());

  }
}


