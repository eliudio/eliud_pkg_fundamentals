{
  "id": "DynamicWidget",
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
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
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
      "fieldName": "content",
      "displayName": "Contents",
      "remark": "Document content",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "contents"
    },
    {
      "fieldName": "background",
      "displayName": "Background",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "contents",
        "description": "Contents"
    },
    {
        "group": "renderer",
        "description": "Renderer"
    },
    {
        "group": "layout",
        "description": "Layout"
    },
    {
        "group": "documentItems",
        "description": "Images"
    },
    {
        "group": "background",
        "description": "Background"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
 ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : Center(child: text(app, context, value.documentID))"
  },
  "depends": ["eliud_core"]
}