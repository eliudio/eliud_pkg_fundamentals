import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:flutter/widgets.dart';

const String IMAGE = 'image';

class ExtendedDocumentParameterProcessor extends DocumentParameterProcessor {
  List<DocumentItemModel> images;

  ExtendedDocumentParameterProcessor(BuildContext context, AccessState state, {this.images})
      : super(context, state);

  String image(KeyValue k) {
    try {
      if (images == null) return null;
      var index = images.indexWhere((element) => element.reference == k.value);
      var documentItemModel = images[index];
      var image = documentItemModel.image;
      if (index >= 0) return image.url;
    } catch (_) {
      debugPrint('DocumentParameterProcessor::image() error');
    }
    return null;
  }

  @override
  String otherKeyValue(String myString, KeyValue k) {
    if (k.key == IMAGE) {
      var value = k.value;
      var url = image(k);
      if (url != null) {
        myString = k.replaceParamInStringWithString(myString, url);
      } else {
        myString = k.replaceParamInStringWithString(
            // ignore: prefer_single_quotes
            myString, "Image with reference $value does not exist");
      }
      return myString;
    } else {
      return super.otherKeyValue(myString, k);
    }
  }
}

