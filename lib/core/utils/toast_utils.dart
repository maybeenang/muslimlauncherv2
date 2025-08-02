import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static Future<void> showSuccessToast(String message) async {
    // Cancel any existing toast first
    await Fluttertoast.cancel();
    
    // Show new toast immediately
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future<void> showErrorToast(String message) async {
    // Cancel any existing toast first
    await Fluttertoast.cancel();
    
    // Show new toast immediately
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future<void> showInfoToast(String message) async {
    // Cancel any existing toast first
    await Fluttertoast.cancel();
    
    // Show new toast immediately
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}