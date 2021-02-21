{
  "id": "Document",
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
      "iconName": "vpn_key",
      "group": "general"
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
      "iconName": "text_format",
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
      "bespokeFormField": "DocumentTextField('Document', state.value.documentRenderer, state.value.content, state.value.images, state.value.background, _onContentChanged)",
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
      "association": true,
      "optional": true,
      "group": "background"
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
    "title": "documentID",
    "subTitle": "name"
  },
  "depends": ["eliud_core"]
}