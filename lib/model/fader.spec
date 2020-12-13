{
  "id": "Fader",
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
    "isExtension": true
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
      "fieldName": "animationMilliseconds",
      "displayName": "Animation Time (millisec)",
      "remark": "The duration of the transition between the images",
      "group": "animationTime",
      "fieldType": "int"
    },
    {
      "fieldName": "imageSeconds",
      "displayName": "Image time (seconds)",
      "remark": "The time to display 1 image",
      "group": "animationTime",
      "fieldType": "int"
    },
    {
      "fieldName": "items",
      "displayName": "Images",
      "group": "items",
      "fieldType": "ListedItem",
      "arrayType": "Array"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "items",
        "description": "Images"
    },
    {
        "group": "rights",
        "description": "Access Rights"
    },
    {
        "group": "animationTime",
        "description": "Animation Times"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "name"
  }
}