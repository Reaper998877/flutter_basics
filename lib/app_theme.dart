import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // ---------------------------------------------------------------------------
  // COLORS
  // ---------------------------------------------------------------------------
  static final Color primaryBlue = Colors.blue.shade600;
  static final Color primaryDarkBlue = Colors.blue.shade700;
  static final Color primaryLightBlue = Colors.blue.shade300;
  static const Color textPrimaryColor = Colors.black87;
  static final Color textSecondaryColor = Colors.grey.shade600;

  // ---------------------------------------------------------------------------
  // TEXT STYLES (General)
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  // CUSTOM TEXT STYLES (From standalone functions)
  // ---------------------------------------------------------------------------
  static TextStyle get textStyle1 {
    return const TextStyle(
      fontSize: 30,
      fontStyle: FontStyle.italic,
      color: Colors.amber,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      wordSpacing: 2,
      shadows: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 1,
          spreadRadius: 1,
          blurStyle: BlurStyle.outer,
        ),
      ],
    );
  }

  static TextStyle textStyle2({Color textColor = Colors.black}) {
    return TextStyle(
      fontSize: 30,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      wordSpacing: 4,
      color: textColor,
    );
  }

  static TextStyle get textStyle3 {
    return const TextStyle(
      fontSize: 40,
      shadows: [
        BoxShadow(
          blurStyle: BlurStyle.outer,
          color: Colors.purple,
          blurRadius: 3,
          spreadRadius: 2,
        ),
      ],
      fontStyle: FontStyle.italic,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      backgroundColor: Colors.white,
    );
  }

  // ---------------------------------------------------------------------------
  // GOOGLE FONTS STYLES
  // ---------------------------------------------------------------------------
  static TextStyle get headingTextStyle {
    return GoogleFonts.amaranth(
      textStyle: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  static TextStyle get dataTextStyle {
    return GoogleFonts.amaranth(
      textStyle: const TextStyle(color: Colors.black, fontSize: 18),
    );
  }

  // ---------------------------------------------------------------------------
  // DECORATIONS & BORDERS
  // ---------------------------------------------------------------------------
  static InputDecoration getSearchInputDecoration() {
    return InputDecoration(
      labelText: 'Search Module',
      labelStyle: TextStyle(color: primaryDarkBlue, fontSize: 16),
      hintText: 'Enter module no.',
      hintStyle: TextStyle(color: textSecondaryColor, fontSize: 16),
      prefixIcon: Icon(Icons.search, color: primaryDarkBlue, size: 24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryLightBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryDarkBlue, width: 2),
      ),
    );
  }

  static BoxShadow get boxShadow1 {
    return const BoxShadow(
      color: Colors.black,
      blurRadius: 4,
      spreadRadius: 4,
      blurStyle: BlurStyle.outer,
      offset: Offset.zero,
    );
  }

  static TableBorder get tableBorder {
    return const TableBorder(
      horizontalInside: BorderSide(color: Colors.black),
      verticalInside: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
    );
  }

  static BoxDecoration get boxDecoration {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
      border: Border(
        left: BorderSide(color: Colors.black, width: 2.0),
        right: BorderSide(color: Colors.black, width: 2.0),
        top: BorderSide.none,
        bottom: BorderSide(color: Colors.black, width: 2.0),
      ),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xffFFCC00), Color(0xffffffff), Color(0xffFFCC00)],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // WIDGET BUILDERS
  // ---------------------------------------------------------------------------
  static AppBar appBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title, style: const TextStyle(fontSize: 20)),
      centerTitle: true,
    );
  }

  static IconButton iconButton({
    BuildContext? context,
    IconData? icon,
    required Function() onPressed,
  }) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 30),
      onPressed: onPressed,
    );
  }

  // ---------------------------------------------------------------------------
  // THEME DATA
  // ---------------------------------------------------------------------------
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,

      appBarTheme: AppBarTheme(
        backgroundColor: primaryBlue,
        elevation: 2,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
          fontFamily: 'autourOne'
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 20.0),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        )
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryDarkBlue,
        contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get app06Theme {
    return ThemeData(
      primarySwatch: Colors.yellow,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          color: Colors.green,
        ),
      ),
    );
  }

  // Gradient should have minimum 2 colors otherwise error
  // Theme / Screen Background Gradient
  static LinearGradient gradient1() {
    return const LinearGradient(
      colors: [
        Color(0xff000C66), Color(0xff5970EC),
        Color(
          0xffFFFFFF,
        ), // 0xff means color is full visible  // ffecd2 is color's hex code
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  // Used in SignupActivity Buttons
  static LinearGradient gradient3() {
    return const LinearGradient(
      colors: [Color(0xff0FF417), Color(0xff052C07)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static TextStyle inputTextStyle1({FontStyle fStyle = FontStyle.normal}) {
    return GoogleFonts.breeSerif(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontStyle: fStyle,
      ),
    );
  }

  static TextStyle inputLabelStyle1({FontStyle fStyle = FontStyle.normal}) {
    return GoogleFonts.breeSerif(
      textStyle: TextStyle(color: Colors.grey, fontSize: 23, fontStyle: fStyle),
    );
  }

  static TextStyle errorTextStyle() {
    return GoogleFonts.poppins(
      color: Colors.redAccent,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle generalTextStyle({
    shadow = false,
    double fSize = 20.0,
    FontWeight fWeight = FontWeight.normal,
    FontStyle fStyle = FontStyle.normal,
    Color textColor = Colors.black,
  }) {
    if (shadow) {
      return GoogleFonts.average(
        color: textColor,
        fontSize: fSize,
        fontWeight: fWeight,
        fontStyle: fStyle,
        letterSpacing: 1,
        wordSpacing: 2,
        shadows: const [
          BoxShadow(
            blurStyle: BlurStyle.outer,
            color: Colors.black,
            blurRadius: 1.5,
            spreadRadius: 1,
          ),
        ],
      );
    } else {
      return GoogleFonts.average(
        color: textColor,
        fontSize: fSize,
        fontWeight: fWeight,
        fontStyle: fStyle,
      );
    }
  }

  // ################################################################################################################################
  static OutlineInputBorder focused({double borderRadius = 15.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: Color(0xff0037cc), width: 3),
    );
  }

  static OutlineInputBorder enabled({double borderRadius = 15.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: Color(0xff797979), width: 2),
    );
  }
}
