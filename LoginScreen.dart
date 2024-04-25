import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:farm_friend/OtpScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  final Color textHexColor = Color(0xffE0BBA1);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Get Started'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: textHexColor,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'USERNAME',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                   const TextField(
                     keyboardType: TextInputType.text,
                     maxLength: 20,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                           width: 2.0,
                         )
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                           width: 2.0,
                         ),
                       ),
                       hintText: 'Enter your username',
                       hintStyle: TextStyle(
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   const SizedBox(height: 10),
                  Text(
                    'PHONE NUMBER',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                   const TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,  // Border color
                          width: 2.0,  // Increase border weight
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,  // Border color when the TextField is focused
                          width: 2.0,  // Increase border weight
                        ),
                      ),
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,  // Make hint text bold
                      ),
                    ),
                  ),
                const  SizedBox(height: 20),
                  // ElevatedButton
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                      ),
                      child: Text(
                        'Get OTP',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

