import 'package:flutter/material.dart';

Padding buildBrandLogo(Widget image, Size size, ThemeData themeData) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.03,
    ),
    child: SizedBox(
      height: size.height * 0.10,
      width: size.width * 0.18,
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(color: themeData.primaryColor),
          color: themeData.cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        child: Center(
          child: image,
        ),
      ),
    ),
  );
}
