import 'package:flutter/material.dart';
import 'package:user_authentication/screens/login_screen.dart';
import 'package:user_authentication/screens/signup_screen.dart';
import 'package:user_authentication/widgets/custom_button.dart';
import 'package:user_authentication/widgets/custom_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //return const Text('Welcome');
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30))),
                    TextSpan(
                        text: 'Zippy Wheels\n ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 55.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold)),
                    // WidgetSpan(
                    //     child: Padding(
                    //         padding: EdgeInsets.symmetric(vertical: 5)
                    //     ),
                    // ),
                    TextSpan(
                      text: '\n Car Rental Company',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'LogIn',
                      onTap: SignInPage(),
                      color: Colors.white,
                      textColor: Colors.lightBlue,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'SignUp',
                      onTap: SignUpPage(),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
