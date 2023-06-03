// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hello/Screens/signInNavBar.dart';

// import '../widgets/randomwidgets.dart';

// class SignUp extends StatelessWidget {
//   SignUp({super.key});

//   TextEditingController semail_control = TextEditingController();
//   TextEditingController spass_control = TextEditingController();
//   signup(context) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: semail_control.text,
//         password: spass_control.text,
//       );
//       print("User Addes Successfully");
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 // crossAxisAlignment: CrossAxisAlignment.center,

//                 children: [
//               const SizedBox(height: 20),
//               Text(
//                 "Register Account",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 15),
//               Text(
//                 "   Please enter data to SignUp",
//                 style: TextStyle(fontSize: 19),
//               ),
//               const SizedBox(height: 35),
//               // Text(
//               //   " Full Name",
//               //   style: TextStyle(color: Colors.black, fontSize: 20),
//               // ),
//               // txtfield("Name"),
//               // const SizedBox(height: 15),
//               Text(
//                 "  Email / Phone",
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//               ),
//               txtfield(
//                 controller: semail_control,
//                   'Email',
//                   reqdsuffix: Icon(Icons.email_outlined)),
//               const SizedBox(height: 15),
//               Text(
//                 "Create your Password",
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//               ),
//               txtfield(
//                 controller: spass_control,
//                 'Password', reqdsuffix: Icon(Icons.lock)),
//               SizedBox(
//                 height: 30,
//               ),
//                 GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Text("back")),
//           ElevatedButton(
//               onPressed: () {
//                 signup(context);
//               },
//               child: Text("signup"))
//               // Container(
//               //   child: ElevatedButton(
//               //       onPressed: () {
//               //         Navigator.push(
//               //             context,
//               //             MaterialPageRoute(
//               //                 builder: (context) => Sign_In_NavBar()));
//               //       },
//               //       child: Text("Sign Up")),
//               //   height: 30,
//               //   width: 350,
//               //   decoration: BoxDecoration(
//               //       color: Colors.blue,
//               //       borderRadius: BorderRadius.circular(500)),

//             ])));
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController semail_control = TextEditingController();
  TextEditingController spass_control = TextEditingController();
  registerUser(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semail_control.text,
        password: spass_control.text,
      );
      print("User Addes Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "SignUp",
            style: TextStyle(fontSize: 35),
          ),
          TextField(
            controller: semail_control,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: spass_control,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: const Text("back")),
          ElevatedButton(
              onPressed: () {
                registerUser(context);
              },
              child: const Text("signup"))
        ],
      ),
    );
  }
}
