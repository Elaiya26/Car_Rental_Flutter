import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:user_authentication/screens/signup_screen.dart';
import 'package:user_authentication/widgets/custom_scaffold.dart';
import 'package:user_authentication/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'forget_password.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _formSignInKey = GlobalKey<FormState>();
  final _emailId = TextEditingController();
  final _passWord = TextEditingController();
  bool rememberPassword = true;
  bool _obscuretext = true;

  var res;
  String? token = "";

  @override
  void initState() {
    //super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    setState(() {
      token = prefer.getString("token");
      print("TOKEN = $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox(height: 5)),
          Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              color: themeData.secondaryHeaderColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _emailId,
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
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _passWord,
                          obscureText: _obscuretext,
                          //obscuringCharacter: '*',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            hintText: 'Enter Password',
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
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberPassword,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberPassword = value!;
                                    });
                                  },
                                  activeColor: Colors.lightBlue,
                                ),
                                Text('Remember Me',
                                    style: TextStyle(
                                        color: themeData.primaryColor)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) => const ForgetPassword()),
                                );
                              },
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: themeData.primaryColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white54)),
                            onPressed: () async {
                              // Get.offAll(() => const MyApp());
                              await loginUser();
                              initState();
                              if (_formSignInKey.currentState!.validate()) {
                                if (res == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Logging In')),
                                  );
                                  await Future.delayed(
                                    const Duration(seconds: 3),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (e) => const HomeScreen()),
                                  );
                                } else if (!rememberPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'please enter your valid details')),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Color(0xff3b22a1), fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Text('Login using'),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
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
                              'Don\'t have an account?',
                              style: TextStyle(color: themeData.primaryColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (e) => const SignUpPage()));
                              },
                              child: const Text(
                                'Signup',
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
              ))
        ],
      ),
    );
  }

  Future<void> loginUser() async {
    var urL = 'http://192.168.200.200:3000/login';
    var regData = {
      'email': _emailId.text,
      'password': _passWord.text,
    };
    var bodies = jsonEncode(regData);
    var urlParse = Uri.parse(urL);
    final response = await http.post(urlParse, body: bodies, headers: {
      "Content-Type": "application/json",
      "authorization": "Bearer $token"
    });
    print(response.body);
    print(token);

    var jsonResponse = jsonDecode(response.body);
    res = jsonResponse['statusCode'];
    print(jsonResponse);
  }

  launch(String url) {}
}

// var url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q={http}');
// http.Response response = await http.get(url);
// try {
// if (response.statusCode == 200) {
// String data = response.body;
// var decodedData = jsonDecode(data);
// return decodedData;
// } else {
// return 'failed';
// }
// } catch (e) {
// return 'failed';
// }
