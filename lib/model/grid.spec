{
  "id": "Grid",
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
      "fieldName": "gridView",
      "displayName": "GridView",
      "remark": "Specific gridview",
      "fieldType": "GridView",
      "association": true,
      "group": "gridView"
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
        "group": "gridView",
        "description": "GridView"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  }
}