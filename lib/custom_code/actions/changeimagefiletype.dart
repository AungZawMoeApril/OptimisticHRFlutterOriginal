// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<ImagePickerModelStruct> changeimagefiletype(
    FFUploadedFile? testimage) async {
  // Add your function code here!
  final returndata = ImagePickerModelStruct();

  try {
    final imageBytes = testimage?.bytes;
    if (imageBytes != null) {
      List<int> imagelist = imageBytes.toList();
      returndata.base64String = base64Encode(imagelist);
      returndata.filename = testimage?.name;
    }
    //  File imageFile = File(filePath);
    //  await imageFile.writeAsBytes(imageBytes);
    //  base64.imagePathdata = filePath; //pickedFile?.path;
    //  base64.imagePathdata = base64Decode(base64.base64String).toString();

    //   base64.filename = pickedFile?.name;
  } catch (e) {
    // returndata.base64String = e.toString();
  }

  return returndata;
}
