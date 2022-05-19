import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

snackBarMessageCelering(BuildContext context, {required String message}){
  final snackBar = SnackBar(content: Text(message).tr());
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}