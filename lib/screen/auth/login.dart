import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/screen/user/home.dart';
import 'package:job_box/screen/auth/register.dart';

import 'package:job_box/util/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Center(
                      child: RichText(
                    text:  TextSpan(
                      children: [
                        TextSpan(
                            text: 'Job',
                             style: GoogleFonts.autourOne(
    textStyle: const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      color: orangeColor,
    ),
  ),
),
TextSpan(
                            text: 'box',
                             style: GoogleFonts.autourOne(
    textStyle: const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      color: brownColor,
    ),
  ),
)
                    
                      ],
                    ),
                  )),
                  SizedBox(
                    height: screenHeight * 0.10,
                  ),
                  const SizedBox(
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SizedBox(
                    width: screenWidth,
                   height: 48,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                        hintText: 'example@mail.com',
                        hintStyle: const TextStyle(color: lightGreyColor, fontSize: 18,fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: brownColor
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: orangeColor
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email.";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const SizedBox(
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SizedBox(
                    width: screenWidth,
                      height: 48,
                    child: TextFormField(
                      controller: _passController,
                      obscureText: _obscureText,
                       obscuringCharacter: '●',
                      style:  TextStyle(
                       color: Colors.black,
                        fontSize:_obscureText? 9 : 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing:_obscureText?3:1
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                        hintText: '●●●●●●●●',
                        hintStyle: const TextStyle(
                         color: lightGreyColor, fontSize: 10,fontWeight: FontWeight.w500,letterSpacing:2
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: brownColor,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: orangeColor,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: greyColor,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: brownColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                
                          SizedBox(
                            width: screenWidth,
                            height: screenHeight * 0.06,
                            child:
                             ElevatedButton(
                              onPressed: () {
                               
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Home()),
                                ) ;
                              },
                              style: ElevatedButton.styleFrom(
                                   shape: RoundedRectangleBorder(
                                    
      borderRadius: BorderRadius.circular(8.0), 
    ),
                                backgroundColor: lightOrangeColor,
                              ),
                              child:  Text(
                                'Login',
                                style: GoogleFonts.notoSans(
    textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: brownColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: orangeColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
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