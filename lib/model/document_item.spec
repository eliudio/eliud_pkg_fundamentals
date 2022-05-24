{
  "id": "DocumentItem",
  "packageName": "eliud_pkg_fundamentals",
  "packageFriendlyName": "fundamentals",
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
      "required": true,
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
      "fieldType": "PlatformMedium",
      "association": true,
      "optional": false
    }
  ],
  "listFields": {
    "title": "ImageHelper.getImageFromPlatformModel(platformMediumModel: value.image!, width: fullScreenWidth(context))",
    "subTitle": "value.reference != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.reference!)) : Container()"
  },
  "depends": ["eliud_core"]
}
