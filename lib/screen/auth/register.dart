import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:job_box/util/color.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  bool _obscureText = true;

    String? email, password, passwordConfirm;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign Up",
            style: GoogleFonts.autourOne(
    textStyle: const TextStyle(
      fontSize: 18,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
      color: brownColor,
    ))),
  
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
               size: 25,
               weight: 30,
              color: brownColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              SizedBox(
                height: screenHeight * 0.06,
              ),
              InkWell(
                child: Center(
                  child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, 
                        border: Border.all(
                          color: brownColor, 
                          width: 1.2, 
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Add\nPhoto",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: brownColor,fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      )),
                ),
                onTap: () {},
              ),

              SizedBox(
                height: screenHeight * 0.04,
              ),
             
            const SizedBox(
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                  ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              SizedBox(
                    width: screenWidth,
                   height: 45,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                        hintText: 'example@mail.com',
                        hintStyle: const TextStyle(color: lightGreyColor, fontSize: 16,fontWeight: FontWeight.w500),
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
                  "New Password",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              SizedBox(
                width: screenWidth,
                  height: 45,
                child: TextFormField(
                  controller: _passwordController,
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
                         color: lightGreyColor, fontSize: 9,fontWeight: FontWeight.w500,letterSpacing:3
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
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,color:lightGreyColor),
                      )),
                        onChanged: (value) {
                        password = value;
                      },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),

              const SizedBox(
                child: Text(
                  "Re-type Password",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              SizedBox(
                width: screenWidth,
                height: 45,
                child: TextFormField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  obscuringCharacter: '●',
                  style: const TextStyle(
                        color: Colors.black,
                        fontSize: 9,fontWeight: FontWeight.w500,letterSpacing:3
                      ),
                 decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                        hintText: '●●●●●●●●',
                        hintStyle: const TextStyle(
                         color: lightGreyColor, fontSize: 9,fontWeight: FontWeight.w500,letterSpacing:3
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
                  ),
                    onChanged: (value) {
                        passwordConfirm = value;
                      },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: SizedBox(
                  width: screenWidth,
                 height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                                   shape: RoundedRectangleBorder(
                                    
      borderRadius: BorderRadius.circular(8.0), 
    ),
                                backgroundColor: lightOrangeColor,
                              ),
                    child:  Text(
                      'Create Account',
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
              ),
              const SizedBox(
                    height: 20,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: orangeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
  textAlign: TextAlign.center,
  text: const TextSpan(
    children: [
      TextSpan(
        text: "By creating an account, you agree to Koko's \n",
        style: TextStyle(fontSize: 13, color: Colors.black),
      ),
    TextSpan(
        text: "\n",
        style: TextStyle(height: 0.08),
      ),
      TextSpan(
        text: "Terms of Use ",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: orangeColor),
      ),
      TextSpan(
        text: "and ",
        style: TextStyle(fontSize: 13, color: Colors.black),
      ),
      TextSpan(
        text: "Privacy",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: orangeColor),
      ),
    ],
  ),
)
        ));
  }
}