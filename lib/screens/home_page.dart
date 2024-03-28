import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:user_authentication/screens/drawer_home.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
//import 'package:user_authentication/themes/theme_mode.dart';
import '../homepage/most_recent.dart';
import '../homepage/top_brands.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double X = 0;
  double Y = 0;
  double Z = 0;
  double scale = 1.0;
  bool toggle = false;
  bool searchClicked = false;
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        const DrawerMenu(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          transform: Matrix4.translationValues(X, Y, Z)..scale(scale),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: themeData.colorScheme.background,
                extendBody: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  centerTitle: true,
                  bottomOpacity: 0.0,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  backgroundColor: themeData.colorScheme.background,
                  leading: IconButton(
                      onPressed: () {
                        setState(() {
                          toggle = !toggle;
                          //print(toggle);
                          if (toggle) {
                            X = 170;
                            Y = 80;
                            Z = 200;
                            scale = 0.85;
                          } else {
                            X = 0;
                            Y = 0;
                            scale = 1.0;
                          }
                        });
                      },
                      icon: Icon(
                        UniconsLine.bars,
                        color: themeData.secondaryHeaderColor,
                      )),
                  title: searchClicked
                      ? Container(
                          alignment: Alignment.center,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: themeData.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (context) {},
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(15, 20, 15, 12),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none,
                              hintText: ('search'),
                            ),
                          ),
                        )
                      : Text(
                          'Zippy Wheels',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              color: themeData.secondaryHeaderColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            searchClicked = !searchClicked;
                            if (!searchClicked) {
                              _searchController.clear();
                            }
                          });
                        },
                        icon: Icon(
                          UniconsLine.search,
                          color: themeData.secondaryHeaderColor,
                          size: 30,
                        ))
                  ],
                ),
                body: SafeArea(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            //border: Border.all(color: themeData.primaryColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            //color: themeData.cardColor,
                            color: themeData.cardColor,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.04,
                                ),
                                child: Align(
                                  child: Text(
                                    'Book as per your plans',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: themeData.secondaryHeaderColor,
                                      fontSize: size.width * 0.06,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.01,
                                ),
                                child: Align(
                                  child: Text(
                                    'Enjoy the driving & have fun',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: themeData.secondaryHeaderColor,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.03,
                                  left: size.width * 0.04,
                                  bottom: size.height * 0.025,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: themeData.colorScheme.background,
                                        border: Border.all(
                                            color: themeData.primaryColor),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'book your dates',
                                        style: GoogleFonts.poppins(
                                            color:
                                                themeData.secondaryHeaderColor),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        List<DateTime>? dateTimeList =
                                            await showOmniDateTimeRangePicker(
                                          context: context,
                                          startInitialDate: DateTime.now(),
                                          startFirstDate: DateTime(1600)
                                              .subtract(
                                                  const Duration(days: 3652)),
                                          startLastDate: DateTime.now().add(
                                            const Duration(days: 3652),
                                          ),
                                          endInitialDate: DateTime.now(),
                                          endFirstDate: DateTime(1600).subtract(
                                              const Duration(days: 3652)),
                                          endLastDate: DateTime.now().add(
                                            const Duration(days: 3652),
                                          ),
                                          is24HourMode: false,
                                          isShowSeconds: false,
                                          minutesInterval: 1,
                                          secondsInterval: 1,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          constraints: const BoxConstraints(
                                            maxWidth: 350,
                                            maxHeight: 650,
                                          ),
                                          transitionBuilder:
                                              (context, anim1, anim2, child) {
                                            return FadeTransition(
                                              opacity: anim1.drive(
                                                Tween(
                                                  begin: 0,
                                                  end: 1,
                                                ),
                                              ),
                                              child: child,
                                            );
                                          },
                                          transitionDuration:
                                              const Duration(milliseconds: 200),
                                          barrierDismissible: true,
                                          selectableDayPredicate: (dateTime) {
                                            // Disable 25th Feb 2023
                                            if (dateTime ==
                                                DateTime(2023, 2, 25)) {
                                              return false;
                                            } else {
                                              return true;
                                            }
                                          },
                                        );
                                      },
                                      child: const Text('Select date '),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      topBrands(size, themeData),
                      mostRented(size, themeData),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
