import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {
  final String carImage;
  final String carClass;
  final String carName;
  final int carPower;
  final String seater;
  final String type;
  final String bags;
  final int carPrice;
  final String carRating;
  final bool isRotated;
  const DetailsPage(
      {super.key,
      required this.carImage,
      required this.carClass,
      required this.carName,
      required this.carPower,
      required this.seater,
      required this.type,
      required this.bags,
      required this.carPrice,
      required this.carRating,
      required this.isRotated});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: themeData.colorScheme.background,
        leading: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
          ),
          child: SizedBox(
            height: size.width * 0.1,
            width: size.width * 0.1,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  UniconsLine.multiply,
                  color: themeData.secondaryHeaderColor,
                  size: size.height * 0.025,
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: size.width * 0.15,
        centerTitle: true,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: themeData.colorScheme.background,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Stack(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      widget.isRotated
                          ? Image.asset(
                              widget.carImage,
                              height: size.width * 0.5,
                              width: size.width * 0.8,
                              fit: BoxFit.contain,
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: Image.asset(
                                widget.carImage,
                                height: size.width * 0.5,
                                width: size.width * 0.8,
                                fit: BoxFit.contain,
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.carClass,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: themeData.primaryColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                            size: size.width * 0.06,
                          ),
                          Text(
                            widget.carRating,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.yellow[800],
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.carName,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              color: themeData.primaryColor,
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.carPrice}',
                            style: GoogleFonts.poppins(
                              color: themeData.primaryColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '/per day',
                            style: GoogleFonts.poppins(
                              color: themeData.primaryColor.withOpacity(0.8),
                              fontSize: size.width * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildStat(
                              UniconsLine.dashboard,
                              '${widget.carPower} KM',
                              'Power',
                              size,
                              themeData,
                            ),
                            buildStat(
                              UniconsLine.users_alt,
                              'Seater',
                              '( ${widget.seater} )',
                              size,
                              themeData,
                            ),
                            buildStat(
                              UniconsLine.briefcase,
                              'Bags',
                              '( ${widget.bags} )',
                              size,
                              themeData,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                        ),
                        child: Text(
                          'Select Location',
                          style: GoogleFonts.poppins(
                            color: themeData.primaryColor,
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: size.height * 0.15,
                          width: size.width * 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: themeData.cardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05,
                                    vertical: size.height * 0.015,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        UniconsLine.map_marker,
                                        color: const Color(0xff3b22a1),
                                        size: size.height * 0.05,
                                      ),
                                      Text(
                                        'Chennai Airport',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: themeData.primaryColor,
                                          fontSize: size.width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Trisulam,Chennai',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: themeData.primaryColor
                                              .withOpacity(0.6),
                                          fontSize: size.width * 0.032,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.15,
                                  width: size.width * 0.25,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Align(
                                      child: Text(
                                        'Map preview',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Padding buildStat(
  IconData icon,
  String title,
  String desc,
  Size size,
  ThemeData themeData,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.015,
    ),
    child: SizedBox(
      height: size.width * 0.32,
      width: size.width * 0.25,
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: size.width * 0.03,
            left: size.width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: const Color(0xff3b22a1),
                size: size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.width * 0.02,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: themeData.primaryColor,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                desc,
                style: GoogleFonts.poppins(
                  color: themeData.primaryColor.withOpacity(0.7),
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
