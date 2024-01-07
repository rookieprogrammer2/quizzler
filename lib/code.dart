// // Assume you have a User class representing user details
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class User {
//   final String uid;
//   final String displayName;
//   final String email;
//   final String role;
//
//   User({
//     required this.uid,
//     required this.displayName,
//     required this.email,
//     required this.role,
//   });
// }
//
// // Firebase Authentication and Firestore
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential authResult = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       return _userFromFirebaseUser(authResult.user!);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   User _userFromFirebaseUser(User user) {
//     // Retrieve additional user details from Firestore
//     // You may want to store this information during registration
//     // and update it whenever the user profile changes
//     // (e.g., if the user switches roles)
//     return User(
//       uid: user.uid,
//       displayName: user.displayName ?? '',
//       email: user.email ?? '',
//       role: 'student', // Default role
//     );
//   }
// }
//
// // Example of how to use the AuthService
// void main() async {
//   AuthService authService = AuthService();
//
//   // Assume email and password are obtained from user input
//   String email = 'user@example.com';
//   String password = 'password';
//
//   User? user = await authService.signInWithEmailAndPassword(email, password);
//
//   if (user != null) {
//     print('User Role: ${user.role}');
//     // Depending on the role, enable or disable certain features
//     if (user.role == 'lecturer') {
//       // Enable quiz creation features
//       print('You can create quizzes!');
//     } else {
//       // Student-specific features
//       print('You are a student.');
//     }
//   } else {
//     print('Authentication failed.');
//   }
// }


// void route() {
//   User? user = FirebaseAuth.instance.currentUser;
//   var kk = FirebaseFirestore.instance
//       .collection('users')
//       .doc(user!.uid)
//       .get()
//       .then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       if (documentSnapshot.get('rool') == "Teacher") {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>  Teacher(),
//           ),
//         );
//       }else{
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>  Student(),
//           ),
//         );
//       }
//     } else {
//       print('Document does not exist on the database');
//     }
//   });
// }
