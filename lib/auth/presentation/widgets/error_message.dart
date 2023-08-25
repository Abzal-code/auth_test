import 'package:flutter/material.dart';

errorMessage(BuildContext context) {
  const SnackBar snackBar = SnackBar(
    content: Text('Invalid inputs, please try again'),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
