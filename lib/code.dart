/// Todo => See if this function works instead of "getUserRole"

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
