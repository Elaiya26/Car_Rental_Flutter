import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/bmw_bg_app.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          //     Expanded(
          //       child: Image.asset(
          //         'assets/bmw-logo-skull2.png',
          //         height: 210,
          //         width: double.infinity,
          //       ),
          //     )
          //   ],
          // ),
          SafeArea(
            child: child!,
            //child: Text('BMW'), //used for const SafeArea
          ),
        ],
      ),
    );
  }
}
