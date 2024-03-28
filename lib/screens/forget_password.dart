import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formSignupKey = GlobalKey<FormState>();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: themeData.colorScheme.background,
        title: Text(
          'Forget Password',
          style: GoogleFonts.poppins(
              fontStyle: FontStyle.italic,
              color: themeData.secondaryHeaderColor,
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 150, 20, 0),
        child: Form(
          key: _formSignupKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Please enter the email address you'd like your password reset information sent to",
                style: TextStyle(color: themeData.primaryColor, fontSize: 17),
              ),
              const SizedBox(
                height: 25,
              ),
              // const Text(
              //   'Enter Email Address',
              //   style: TextStyle(color: Colors.black45),
              // ),
              TextFormField(
                controller: email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp emailExp = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (value == null || value.isEmpty) {
                    return 'Please enter your E-mail';
                  } else if (!emailExp.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  icon: const Icon(Icons.email),
                  label: const Text('Email'),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: themeData.primaryColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: themeData.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themeData.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formSignupKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Email sent'),
                              content: const Text(
                                'You will receive you an email that will allow you to reset your password',
                                style: TextStyle(fontSize: 15),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ));
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue)),
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
