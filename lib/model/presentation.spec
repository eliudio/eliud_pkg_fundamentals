{
  "id": "Presentation",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "title",
      "displayName": "Title",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "bodyComponents",
      "displayName": "Components",
      "fieldType": "BodyComponent",
      "arrayType": "Array",
      "group": "components"
    },
    {
      "fieldName": "image",
      "displayName": "Image",
      "fieldType": "Image",
      "association": true,
      "group": "image",
      "optional": true
    },
    {
      "fieldName": "imagePositionRelative",
      "displayName": "Relative position of the image",
      "fieldType": "enum",
      "enumName": "PresentationRelativeImagePosition",
      "enumValues" : [ "Behind", "InFront", "Below", "Above", "Aside" ],
      "group": "imagePositionRelative"
    },
    {
      "fieldName": "imageAlignment",
      "displayName": "Alignment of the image",
      "fieldType": "enum",
      "enumName": "PresentationImageAlignment",
      "enumValues" : [ "Left", "Center", "Right" ],
      "group": "imageAlignment"
    },
    {
      "fieldName": "imageWidth",
      "displayName": "Image Width (% of screen width)",
      "fieldType": "double",
      "remark": "Width of the image",
      "group": "general"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "components",
        "description": "Components"
    },
    {
        "group": "image",
        "description": "Optional Image"
    },
    {
        "group": "imagePositionRelative",
        "description": "Relative position of the image"
    },
    {
        "group": "imageAlignment",
        "description": "Alignment of the image"
    },
    {
      "fieldName": "imageWidth",
      "displayName": "Image Width (% of screen width)",
      "fieldType": "double",
      "remark": "Width of the image",
      "group": "general"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  },
  "depends": ["eliud_core"]
}