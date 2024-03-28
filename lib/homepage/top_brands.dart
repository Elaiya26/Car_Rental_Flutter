//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_authentication/components/brand_logo.dart';

Column topBrands(Size size, ThemeData themeData) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.03,
              left: size.width * 0.05,
            ),
            child: Text(
              'Top Brands',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: themeData.secondaryHeaderColor,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.055,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.03,
              right: size.width * 0.05,
            ),
            // child: Text(
            //   'View All',
            //   textAlign: TextAlign.center,
            //   style: GoogleFonts.poppins(
            //     color: themeData.secondaryHeaderColor,
            //     fontSize: size.width * 0.04,
            //   ),
            // ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBrandLogo(
                  Image.asset(
                    'assets/icons/rolls-royce-logo.png',
                    height: size.width * 0.15,
                    width: size.width * 0.13,
                    fit: BoxFit.fill,
                  ),
                  size,
                  themeData,
                ),
                buildBrandLogo(
                    Image.asset(
                      'assets/icons/bmw-icon.png',
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      fit: BoxFit.fill,
                    ),
                    size,
                    themeData),
                buildBrandLogo(
                  Image.asset(
                    'assets/icons/porsche-logo.png',
                    height: size.width * 0.15,
                    width: size.width * 0.16,
                    fit: BoxFit.fill,
                  ),
                  size,
                  themeData,
                ),
                buildBrandLogo(
                  Image.asset(
                    'assets/icons/bentley-logo.png',
                    height: size.width * 0.15,
                    width: size.width * 0.15,
                    fit: BoxFit.fill,
                  ),
                  size,
                  themeData,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
