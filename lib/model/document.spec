{
  "id": "Document",
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
      "fieldName": "documentRenderer",
      "displayName": "Document Renderer",
      "remark": "Document renderer. Different renderers offer different functionality",
      "fieldType": "enum",
      "enumName": "DocumentRenderer",
      "group": "renderer",
      "enumValues" : [ "flutter_markdown", "dynamic_widget" ]
    },
    {
      "fieldName": "content",
      "displayName": "Contents",
      "remark": "Document content",
      "fieldType": "String",
      "iconName": "text_format",
      "bespokeFormField": "DocumentTextField(widget.app, 'Document', state.value!.documentRenderer, state.value!.content, state.value!.images, state.value!.background, _onContentChanged)",
      "group": "contents"
    },
    {
      "fieldName": "padding",
      "displayName": "Padding",
      "remark": "Left, right, top and bottom padding.",
      "fieldType": "double",
      "iconName": "border_style",
      "group": "layout"
    },
    {
      "fieldName": "images",
      "displayName": "Images",
      "group": "documentItems",
      "fieldType": "DocumentItem",
      "arrayType": "Array"
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
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : value.documentID != null ? Center(child: text(app, context, value.documentID)) : Container()"
  },
  "depends": ["eliud_core"]
}