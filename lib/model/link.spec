{
  "id": "Link",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": false,
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
      "defaultValue": "IDENTIFIED",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "linkText",
      "displayName": "Link text",
      "group": "general",
      "fieldType": "String"
    },
    {
      "fieldName": "action",
      "displayName": "Action",
      "group": "action",
      "fieldType": "Action",
      "bespokeFormField": "ActionField"
    }
  ],
  "groups": [
    {
       "group": "general",
       "description": "General"
    },
    {
       "group": "action",
       "description": "Action"
    }
  ],
  "listFields": {
    "title": "linkText"
  }
}
