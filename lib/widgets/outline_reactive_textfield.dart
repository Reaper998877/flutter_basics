import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';


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

    final errorStyle = GoogleFonts.poppins(color: Colors.redAccent, fontSize: 15, fontWeight: FontWeight.w700);

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
          enableInteractiveSelection: false, style: GoogleFonts.breeSerif(textStyle: const TextStyle(color: Colors.black, fontSize: 20)),
          cursorHeight: 30, cursorWidth: 3, cursorRadius: const Radius.circular(5), cursorColor: Colors.blue.shade900,
          controller: textEditingController,keyboardType: keyboardType, formControlName: formControlName,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            labelText: label,
            labelStyle: GoogleFonts.breeSerif(textStyle: const TextStyle(color: Colors.grey, fontSize: 23)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Color(0xff797979), width: 2)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Color(0xff0037cc), width: 3)
            ),
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
                      icon: Icon(size: 25 ,isObscureted.value ? suffixIcon : Icons.visibility_off),
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
