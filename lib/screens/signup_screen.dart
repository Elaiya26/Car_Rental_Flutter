import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:user_authentication/screens/home_page.dart';
import 'package:user_authentication/screens/login_screen.dart';
import 'package:user_authentication/widgets/custom_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = false;

  final _username = TextEditingController();
  final _number = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _reenterPW = TextEditingController();
  bool _obscuretext = true;
  //final _mobilenumber = TextEditingController();
  var res;
  String token = '';
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox(height: 2)),
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: GoogleFonts.poppins(
                            fontStyle: FontStyle.italic,
                            color: themeData.secondaryHeaderColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        // onChanged: (value) {
                        //   _formSignupKey.currentState!.validate();
                        // },
                        controller: _username,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          label: const Text('Full Name'),
                          hintText: 'Enter Full Name',
                          hintStyle: TextStyle(
                            color: themeData.primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeData
                                  .primaryColor, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeData
                                  .primaryColor, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      IntlPhoneField(
                        controller: _number,
                        initialCountryCode: 'IN',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (phone) {
                          if (phone == null) {
                            return 'Enter your Mobile number';
                          }
                          return null;
                        },
                        onCountryChanged: (country) {
                          'Country changed to: ${country.name}';
                        },
                        disableLengthCheck: false,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.phone_iphone),
                          label: const Text('Mobile Number'),
                          hintText: 'Enter your  number',
                          hintStyle: TextStyle(color: themeData.primaryColor),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: themeData.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: themeData.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _email,
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
                            borderSide:
                                BorderSide(color: themeData.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: themeData.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          } else if (value.length < 8) {
                            return 'Password length must be minimum 8 letters';
                          } else if (!regex.hasMatch(value)) {
                            return 'Password should contain upper,lower,digit and Special character';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: const Icon(Icons.key),
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: themeData.primaryColor),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: themeData.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: themeData.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _reenterPW,
                        obscureText: _obscuretext,
                        //obscuringCharacter: '*',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Re-enter your Password';
                          } else if (value != _password.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock_open),
                          label: const Text('Confirm Password'),
                          hintText: 'Re-enter Password',
                          hintStyle: TextStyle(color: themeData.primaryColor),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscuretext = !_obscuretext;
                              });
                            },
                            icon: Icon(_obscuretext
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: themeData.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: themeData.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: Colors.lightBlue,
                          ),
                          Text('Agree the Terms & Condition',
                              style: TextStyle(color: themeData.primaryColor)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white54)),
                          onPressed: () async {
                            await register();
                            if (_formSignupKey.currentState!.validate()) {
                              if (res == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('User Registered'),
                                  ),
                                );
                                await Future.delayed(
                                  const Duration(seconds: 3),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) => const HomeScreen()),
                                );
                              } else if (!agreePersonalData) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Account already exist!..')),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Color(0xff3b22a1), fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Signup with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(Logos.google),
                          Logo(Logos.twitter),
                          Logo(Logos.facebook_f),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: themeData.primaryColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) => const SignInPage()));
                            },
                            child: const Text(
                              'SignIn',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff3b22a1)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> register() async {
    var url = 'http://192.168.200.200:3000/signup';
    var regData = {
      'name': _username.text,
      'phoneNumber': _number.text,
      'email': _email.text,
      'password': _password.text,
    };
    var bodyData = jsonEncode(regData);
    var urlParse = Uri.parse(url);
    final response = await http.post(urlParse,
        body: bodyData, headers: {"Content-Type": "application/json"});
    var jsonResponse = jsonDecode(response.body);
    res = jsonResponse['statusCode'];
    token = jsonResponse['token'];
    print(token);
    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setString("token", token);
    print(prefer);
    print(jsonResponse);
  }

  // void postPage() async {
  //   SharedPreferences prefer = await SharedPreferences.getInstance();
  //   await prefer.setString("signin", token);
  //   print(prefer);
  // }
}

// TextFormField(
//   controller: _mobilenumber,
//   keyboardType: TextInputType.number,
//   inputFormatters: <TextInputFormatter>[
//     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//     FilteringTextInputFormatter.digitsOnly,
//   ],
//   decoration: InputDecoration(
//     icon: const Icon(Icons.phone_iphone),
//     label: const Text('Mobile Number'),
//     hintText: 'Enter your Mobile number',
//     hintStyle: const TextStyle(color: Colors.black26),
//     border: OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.black12),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     enabledBorder: OutlineInputBorder(
//         borderSide:
//             const BorderSide(color: Colors.black12),
//         borderRadius: BorderRadius.circular(10)),
//   ),
// ),
