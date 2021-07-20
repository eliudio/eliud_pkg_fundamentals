{
  "id": "DecoratedContent",
  "packageName": "eliud_pkg_fundamentals",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": true,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "iconName": "vpn_key"
    },
    {
      "fieldName": "appId",
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "group": "general",
      "iconName": "text_format"
    },
    {
      "fieldName": "decoratingComponentName",
      "group": "decoratingComponent",
      "remark": "The component name of the decoration",
      "fieldType": "String",
      "bespokeFormField": "ExtensionTypeField"
    },
    {
      "fieldName": "decoratingComponentId",
      "group": "decoratingComponentId",
      "remark": "For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page",
      "fieldType": "String",
      "bespokeFormField": "ComponentIdField(componentName: state.value!.decoratingComponentName, value: state.value!.decoratingComponentId, trigger: _onDecoratingComponentIdChanged)"
    },
    {
      "fieldName": "contentComponentName",
      "group": "contentComponent",
      "remark": "The component name of the content",
      "fieldType": "String",
      "bespokeFormField": "ExtensionTypeField"
    },
    {
      "fieldName": "contentComponentId",
      "group": "contentComponentId",
      "remark": "For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page",
      "fieldType": "String",
      "bespokeFormField": "ComponentIdField(componentName: state.value!.contentComponentName, value: state.value!.contentComponentId, trigger: _onContentComponentIdChanged)"
    },
    {
      "fieldName": "decorationComponentPosition",
      "displayName": "Position of the decoration",
      "fieldType": "enum",
      "enumName": "DecorationComponentPosition",
      "enumValues" : [ "LeftIfSpaceAvailableOtherwiseTop", "LeftIfSpaceAvailableOtherwiseDrop", "LeftIfSpaceAvailableOtherwiseBottom", "RightIfSpaceAvailableOtherwiseTop", "RightIfSpaceAvailableOtherwiseDrop", "RightIfSpaceAvailableOtherwiseBottom" ],
      "group": "imagePosition"
    },
    {
      "fieldName": "percentageDecorationVisible",
      "displayName": "Percentage Decoration Visible",
      "fieldType": "double"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "ConditionsSimple",
      "group": "conditional"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "conditional",
        "description": "Conditions"
    },
    {
        "group": "imagePosition",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "documentID!",
    "subTitle": "name!"
  },
  "depends": ["eliud_core"]
}