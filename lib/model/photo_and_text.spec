{
  "id": "PhotoAndText",
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
    "isDocumentCollection": true
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
      "displayName": "Text",
      "fieldType": "String"
    },
    {
      "fieldName": "contents",
      "displayName": "Contents",
      "fieldType": "String"
    },
    {
      "fieldName": "image",
      "displayName": "Image",
      "association": true,
      "fieldType": "MemberMedium"
    },
    {
      "fieldName": "imagePosition",
      "displayName": "Position of the image",
      "fieldType": "enum",
      "enumName": "PhotoAndTextImagePosition",
      "enumValues" : [ "LeftIfSpaceAvailableOtherwiseTop", "LeftIfSpaceAvailableOtherwiseDrop", "LeftIfSpaceAvailableOtherwiseBottom", "RightIfSpaceAvailableOtherwiseTop", "RightIfSpaceAvailableOtherwiseDrop", "RightIfSpaceAvailableOtherwiseBottom" ],
      "group": "imagePosition"
    },
    {
      "fieldName": "percentageImageVisible",
      "displayName": "Percentage Image Visible",
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
        "group": "fontTitle",
        "description": "Font Title"
    },
    {
        "group": "fontText",
        "description": "Font Text"
    },
    {
        "group": "sections",
        "description": "Sections"
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
    "title": "documentID",
    "subTitle": "name"
  },
  "depends": ["eliud_core"]
}