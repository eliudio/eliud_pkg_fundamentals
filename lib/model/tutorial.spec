{
  "id": "Tutorial",
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
      "fieldName": "title",
      "displayName": "Title",
      "fieldType": "String",
      "group": "general",
      "iconName": "text_format"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general",
      "iconName": "text_format"
    },
    {
      "fieldName": "tutorialEntries",
      "displayName": "Tutorial Entries",
      "group": "tutorialEntries",
      "fieldType": "TutorialEntry",
      "arrayType": "Array"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "ConditionsSimple",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "tutorialEntries",
        "description": "Tutorial Entries"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container()",
    "subTitle": "value.name != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.name!)) : Container()"
  },
  "depends": ["eliud_core"]
}