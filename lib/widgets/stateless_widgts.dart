import 'package:flutter/material.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:flutter_basics/screens/app09/second_screen.dart';
import 'package:flutter_basics/home.dart';
import 'package:url_launcher/url_launcher.dart';

// This widgets are created by me.
class RectangularItems extends StatelessWidget {
  const RectangularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 200,
        color: Colors.purple,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SquareItems extends StatelessWidget {
  const SquareItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: 200,
        color: Colors.teal,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
                child: const Text(
                  'Splitting the App into Widgets',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                  softWrap: true,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Gradient gradient;
  final Color borderColor;
  final double opacity;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradient,
    required this.borderColor,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10.0), // Adjust as needed
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 10,
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 13.0,
              bottom: 13.0,
            ),
            side: BorderSide(color: borderColor, style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
              fontFamily: 'autourOne',
              shadows: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.black,
                  blurRadius: 1.5,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OutlineReactiveTextField extends HookWidget {
  final String formControlName, label;
  final String? errorText;
  final void Function(FormControl<Object?> value)? onChanged;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool obscureText, suffixIconPressable;
  final Map<String, String Function(Object)>? validationMessages;
  final bool Function(FormControl<Object?> control)? showErrors;
  final TextInputType keyboardType;
  final TextEditingController? textEditingController;

  const OutlineReactiveTextField({
    super.key,
    required this.formControlName,
    required this.label,
    required this.keyboardType,
    this.textEditingController,
    this.errorText,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconColor,
    this.obscureText = false,
    this.validationMessages,
    this.showErrors,
    this.suffixIconPressable = false,
  });

  @override
  Widget build(BuildContext context) {
    final isObscureted = useState(obscureText);

    const radious = 15.0;

    final errorStyle = AppTheme.errorTextStyle();

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radious),
      borderSide: BorderSide(color: Colors.red.shade900, width: 2),
    );

    final focusedErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radious),
      borderSide: BorderSide(color: Colors.red.shade900, width: 2),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReactiveTextField(
          enableInteractiveSelection: false,
          style: AppTheme.inputTextStyle1(),
          cursorHeight: 30,
          cursorWidth: 3,
          cursorRadius: const Radius.circular(5),
          cursorColor: Colors.blue.shade900,
          controller: textEditingController,
          keyboardType: keyboardType,
          formControlName: formControlName,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 5.0,
            ),
            labelText: label,
            labelStyle: AppTheme.inputLabelStyle1(),
            enabledBorder: AppTheme.enabled(),
            focusedBorder: AppTheme.focused(),
            errorText: errorText,
            errorStyle: errorStyle,
            errorBorder: errorBorder,
            focusedErrorBorder: focusedErrorBorder,
            suffixIconColor: Colors.black,
            suffixIcon: suffixIconPressable
                ? Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashRadius: 20,
                      onPressed: () => isObscureted.value = !isObscureted.value,
                      icon: Icon(
                        size: 25,
                        isObscureted.value ? suffixIcon : Icons.visibility_off,
                      ),
                    ),
                  )
                : Icon(suffixIcon, size: 25, color: suffixIconColor),
            filled: true,
            fillColor: Colors.white,
          ),
          validationMessages: validationMessages,
          obscureText: isObscureted.value,
          showErrors: showErrors,
        ),
      ],
    );
  }
}

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      iconColor: Colors.red,
      surfaceTintColor: Colors.white,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Less Xerox',
            onTap: () {
              debugPrint("Clicked on Less Xerox");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('res/img/less_xerox.png', height: 28, width: 28),
                const SizedBox(width: 8),
                const Text(
                  "Less Xerox",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Next Screen',
            onTap: () {
              debugPrint("Clicked on My Settings");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(path: "Main"),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('res/img/settings.png', height: 28, width: 28),
                const SizedBox(width: 8),
                const Text(
                  "Next Screen",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String gitLink;

  const CustomAppBar({super.key, required this.title, required this.gitLink});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () async {
            // On Android - Opens website within app
            if (await launchUrl(Uri.parse(gitLink))) {
              debugPrint("Launch Successfull");
            } else {
              debugPrint("Launch Failed! Error occurred");
            }
          },
          icon: Icon(FontAwesomeIcons.github),
        ),

        IconButton(
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const Home(title: 'Flutter Basics'),
                ),
                (route) => false,
              );
            });
          },
          icon: Icon(Icons.home),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class RoundButton extends StatelessWidget {
  final String btnName;
  final Icon? icon; //  Icon? means icon can be null
  final Color? bgColor; //  Color? means color can be null
  final TextStyle? textStyle; //  TextStyle? means textStyle can be null
  final VoidCallback? callback; //  VoidCallback? means callback can be null

  // Constructor
  const RoundButton({
    super.key,
    required this.btnName, // required means btnName is compulsory
    this.icon,
    this.bgColor = Colors.amber,
    this.textStyle,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback!(); // callback is not null
      },

      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: bgColor,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),

      child: icon != null
          ? Row(
              // checks if icon is null or not
              // if icon is not null then Text widget and icon will be seen in a Row
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!, // icon! means icon will be available
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(btnName, style: textStyle),
                ),
              ],
            )
          : Center(
              child: Text(btnName, style: textStyle),
            ), // if icon is null then only Text widget will be seen
    );
  }
}
