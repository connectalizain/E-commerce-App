import 'package:flutter/material.dart';
import 'package:hello/Screens/homescreen.dart';
import 'package:hello/Screens/signup.dart';
// import 'package:hello/Screens/unlogin.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
          child:Column(
              children:  [
                const SizedBox(height: 20),
             
                     Text(
                      "   Welcome back to Mega Mall",
                      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
              
                const SizedBox(height: 20),
              
                     Text(
                      "   Please enter data to login",
              
                      style: TextStyle(fontSize: 19),
                      
                      
                    ),
                 
                const SizedBox(height: 35),
           
                     Text(
                      "   Email / Phone",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 400,
                  child: const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Email / Phone"),
                  ),
                ),
                const SizedBox(height: 10),
            
                     Text(
                      "   Password",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                 
                const SizedBox(height: 10),
                Container(
                  width: 400,
                  height: 50,
                  child: const TextField(
                    
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          suffixIcon: Icon(Icons.remove_red_eye))),
                ),
                 const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const HomeScreen()));
                  },
                  child:const Text("Sign In",
                  style: TextStyle(
                    fontSize: 22
                  ),),
                ),
                const SizedBox(height: 50),
                Row(children: [
                  Text("   Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),),
                  SizedBox(width: 250,),
               TextButton(onPressed: (){  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupView()));}, child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),))
                ],)
              ],
            )
       
      ),
    );
  }
}
