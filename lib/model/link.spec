{
  "id": "Link",
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
      "bespokeFormField": "ActionField(AccessBloc.appId(context), state.value.action, _onActionChanged)"
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
