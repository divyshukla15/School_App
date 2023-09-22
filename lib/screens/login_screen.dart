import 'package:flutter/material.dart';
import 'package:school_app/route.dart';

String Email = "";
late bool hidePass;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    //hidePass = true;
    // TODO: implement initState
    super.initState();
    hidePass = true;
  }

  Widget build(BuildContext context) {
   // bool changeButton =false;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.4,
            // width: 200,
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 200,
                      child: Image.asset(
                        "assets/boy.png",
                      )),
                  Text(" hi student"),
                  Text("signup to continue")
                ])),
        Container(
          //width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height,
          // width: 200,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100))),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cant be empty";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please Enter a Valid Email";
                      } else {
                        Email = value;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    //controller: password,

                    obscureText: hidePass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (!RegExp(r'\S\w{4,}').hasMatch(value)) {
                        return "Password must be more than 4 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      label: Text("Password"),
                      suffixIcon: IconButton(
                        icon: Icon(hidePass
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_sharp),
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                      ),
                      icon: null,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      height: 30,
                      //width: 30,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(" sign up"),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                           Navigator.pushReplacementNamed(context, MyRoute.homeScreen);
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "forgot password",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
