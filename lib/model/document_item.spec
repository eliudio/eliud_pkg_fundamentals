{
  "id": "DocumentItem",
  "packageName": "eliud_pkg_fundamentals",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "reference",
      "displayName": "Document Reference",
      "remark": "This is the reference which you can use inside your document to use to this image, e.g. <img src = \\\"\\${REFERENCE}\\\"",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "REFERENCE",
      "iconName": "vpn_key"
    },
    {
      "fieldName": "image",
      "fieldType": "MemberMedium",
      "association": true,
      "optional": false
    }
  ],
  "listFields": {
    "title": "image!",
    "imageTitle": true,
    "subTitle": "reference!"
  },
  "depends": ["eliud_core"]
}
