{
  "id": "DecoratedContent",
  "packageName": "eliud_pkg_fundamentals",
  "packageFriendlyName": "fundamentals",
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
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
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
      "bespokeFormField": "ComponentIdField(widget.app, componentName: state.value!.decoratingComponentName, value: state.value!.decoratingComponentId, trigger: (value, _) => _onDecoratingComponentIdChanged(value))"
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
      "bespokeFormField": "ComponentIdField(widget.app, componentName: state.value!.contentComponentName, value: state.value!.contentComponentId, trigger: (value, _) => _onContentComponentIdChanged(value))"
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
      "fieldType": "StorageConditions",
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
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : value.documentID != null ? Center(child: text(app, context, value.documentID!)) : Container()"
  },
  "depends": ["eliud_core"]
}