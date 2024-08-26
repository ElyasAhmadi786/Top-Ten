import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 250,
                backgroundImage: AssetImage(
                  "assets/Isaac Newton.jpeg",
                ),
              ),
              SizedBox(height: 28),
              Text('Developed By EA',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ],
          ),
          // Add icons/text for each programming language around the circular photo here
        ],
      ),
    );
  }
}

//

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image.asset('assets/image1.png'),
//                 Image.asset('assets/image2.png'),
//                 Image.asset('assets/image3.png'),
//                 Image.asset('assets/image4.png'),
//               ],
//             ),
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 40,
//               child: Text('Sports'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// Stack(
//       children:[ Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/logo.png")
//             )
//         ),
//       ),
//     ]
//     );
//   }
// }
