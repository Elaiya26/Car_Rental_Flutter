import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/car_build.dart';
import '../widgets/cars_data.dart';

Widget mostRented(Size size, ThemeData themeData) {
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
              'Most Rented',
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
            child: Text(
              'View All',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: themeData.secondaryHeaderColor,
                fontSize: size.width * 0.04,
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.015,
                left: size.width * 0.03,
                right: size.width * 0.03,
              ),
              child: SizedBox(
                height: size.height * 0.25,
                width: cars.length * size.width * 0.5,
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cars.length,
                  itemBuilder: (context, i) {
                    return buildCar(
                      i,
                      size,
                      themeData,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
