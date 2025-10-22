// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>?> contactstaffSearch(
  List<dynamic>? contactList,
  String? searchQuery,
) async {
  print(contactList);
  print(searchQuery);
  // Add your function code here!
  if (searchQuery == null || searchQuery.isEmpty) {
    return contactList;
  }

  // Perform case-insensitive filtering on 'fullName'
  final filteredList = contactList
      ?.where(
        (contact) => contact['fullName']
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase()),
      )
      .toList();
  print(filteredList);
  // Return the filtered list
  return filteredList;
}
