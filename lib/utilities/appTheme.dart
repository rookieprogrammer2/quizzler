// import 'package:flutter/material.dart';
//
// abstract class MyThemeData {
//
//   static const Color lightColor = Color (0xffB7935F);
//   static const Color darkColor = Color (0xff141A2E);
//   static const Color yellowColor = Color (0xffFACC1D);
//
//   static var lightTheme = ThemeData(
//       scaffoldBackgroundColor: Colors.transparent,
//       primaryColor: lightColor,
//       colorScheme: ColorScheme(
//           brightness: Brightness.light,
//           primary: lightColor,
//           onPrimary: Colors.black54,
//           secondary: Colors.grey.shade300,
//           onSecondary: Colors.black54,
//           error: Colors.red,
//           onError: Colors.white,
//           background: Colors.transparent,
//           onBackground: lightColor,
//           surface: Colors.white,
//           onSurface: Colors.black54
//       ),
//
//       textTheme: TextTheme(
//         bodySmall: GoogleFonts.elMessiri(fontSize: 18, fontWeight: FontWeight.bold, color: lightColor),
//         bodyMedium: GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black54),
//         bodyLarge: GoogleFonts.elMessiri(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
//       ),
//
//       appBarTheme: const AppBarTheme(
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         iconTheme: IconThemeData(color: lightColor, size: 30),
//       ),
//
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: lightColor,
//         type: BottomNavigationBarType.shifting,
//         selectedItemColor: Colors.black,
//         selectedLabelStyle: TextStyle(color: Colors.black),
//         unselectedItemColor: Colors.white,
//         unselectedLabelStyle: TextStyle(color: Colors.white),
//       )
//   );
//
//   static ThemeData darkTheme = ThemeData();
//
// }