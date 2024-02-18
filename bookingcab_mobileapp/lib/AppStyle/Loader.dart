import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

void showCustomeLoader(BuildContext context){
  Loader.show(context,
    isSafeAreaOverlay: false,
    isBottomBarOverlay: false,
    overlayFromBottom: 80,
    overlayColor: Colors.black26,
    progressIndicator: CircularProgressIndicator(backgroundColor: Colors.red),
    themeData: Theme.of(context)
      .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
  );
}

void hideCustomeLoader(BuildContext context){
  Future.delayed(Duration(seconds: 1), () {
       Loader.hide();
    });
}