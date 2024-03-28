import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_authentication/screens/login_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.5, 1),
          colors: [Colors.black12, Colors.white70],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/bmw_logo_skull.png'),
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  'Elaiya',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  'elaiyabmw@gmail.com',
                  style: TextStyle(color: Colors.white),
                )),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.book,
                ),
              ),
              title: const Text(
                'Models',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.miscellaneous_services,
                ),
              ),
              title: const Text(
                'Services',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.account_box,
                ),
              ),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.help,
                ),
              ),
              title: const Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.contact_phone,
                ),
              ),
              title: const Text(
                'Contact us',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          icon: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          content: const Text(
                            'Are you sure you want to logout?',
                            style: TextStyle(fontSize: 15),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (e) => const SignInPage()));
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        ));
              },
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.logout,
                ),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
