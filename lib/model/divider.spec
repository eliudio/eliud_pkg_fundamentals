{
  "id": "Divider",
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
      "group": "general",
      "fieldType": "String",
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
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "color",
      "displayName": "Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 0, opacity: 1.00)",
      "group": "shape",
      "fieldType": "Rgb",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Color\", state.value.color, _onColorChanged)"
    },
    {
      "fieldName": "height",
      "displayName": "Height",
      "group": "shape",
      "remark": "The divider's height extent. The divider itself is always drawn as a horizontal line that is centered within the height specified by this value.",
      "fieldType": "double",
      "iconName": "vertical_align_top"
    },
    {
      "fieldName": "thickness",
      "displayName": "Thickness",
      "group": "shape",
      "remark": "The thickness of the line drawn within the divider. A divider with a thickness of 0.0 is always drawn as a line with a height of exactly one device pixel.",
      "fieldType": "double",
      "iconName": "vertical_align_center"
    },
    {
      "fieldName": "indent",
      "displayName": "Indent",
      "group": "shape",
      "remark": "The amount of empty space to the leading edge of the divider.",
      "iconName": "format_indent_increase",
      "fieldType": "double"
    },
    {
      "fieldName": "endIndent",
      "displayName": "End Indent",
      "group": "shape",
      "remark": "The amount of empty space to the trailing edge of the divider.",
      "iconName": "format_indent_decrease",
      "fieldType": "double"
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
        "group": "shape",
        "description": "Shape"
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
