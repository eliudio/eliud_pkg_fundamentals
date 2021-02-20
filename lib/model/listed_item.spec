{
  "id": "ListedItem",
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
      "fieldName": "description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "action",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(AccessBloc.appId(context), state.value.action, _onActionChanged)",
      "group": "action"
    },
    {
      "fieldName": "image",
      "fieldType": "MemberMedium",
      "association": true,
      "optional": false,
      "group": "image"
    },
    {
      "fieldName": "posSize",
      "fieldType": "PosSize",
      "group": "posSize",
      "optional": true,
      "association": true
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
    },
    {
        "group": "image",
        "description": "Image"
    },
    {
        "group": "posSize",
        "description": "Position and Size"
    }
  ],
  "listFields": {
    "title": "description",
    "subTitle": "description"
  },
  "depends": ["eliud_core"]
}
