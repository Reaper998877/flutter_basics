import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'outline_reactive_textfield.dart';
// Comments Done
class BuildDialog extends StatefulWidget{
  final Function(List<String>)? onSubmitted;
  final void Function()? onDelete;
  List<dynamic>? elementToEdit;
  final bool? edit;
  final bool formCheck;

  BuildDialog({super.key, required this.formCheck, this.onSubmitted, this.onDelete, this.edit, this.elementToEdit});

  @override
  State<BuildDialog> createState() => _BuildDialogState();
}

class _BuildDialogState extends State<BuildDialog> {

  late final form;

  @override
  void initState() {
    super.initState();

    form = FormGroup({
      'description': FormControl<String>(
        validators: [ Validators.required, Validators.pattern(r'^[a-zA-Z\s]*$'), ],
        value: widget.edit! ? widget.elementToEdit![0] : ""
      ),
      'amount': FormControl<String>(
        validators: [ Validators.required, Validators.minLength(1), Validators.pattern(r'^[0-9].*$') ],
        value: widget.edit! ? widget.elementToEdit![1].toString() : null
      ),
    });
  }

  String getValue(String formcontrol){ return form.control(formcontrol).value.toString().trim(); }

  @override
  Widget build(BuildContext context) {
    return Dialog( backgroundColor: Colors.white ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: widget.formCheck ? buildReactiveForm() : buildDeleteDialog(),
    );
  }

  // Returns a dialog with ReactiveForm for Add row and Edit Row feature.
  Widget buildReactiveForm(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.39, width: MediaQuery.of(context).size.width * 0.80, padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ReactiveForm( formGroup: form,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(alignment: Alignment.centerLeft ,child: Text("Description", style: GoogleFonts.amaranth(textStyle: const TextStyle(color: Colors.black, fontSize: 20)),)),
              const SizedBox(height: 10),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  final isDirty = formGroup.control('description').dirty;
                  final isValidName = formGroup.control('description').valid;
                  return OutlineReactiveTextField(
                    formControlName: 'description', label: 'Enter Description',
                    showErrors: (control) => false, keyboardType: TextInputType.name,
                    suffixIcon: (isDirty) ?
                    (isValidName) ? Icons.check_circle : Icons.dangerous
                        : null,
                    suffixIconColor: (isValidName) ? Colors.green : Colors.red,
                  );
                },
              ),
              const SizedBox(height: 20),
              Align(alignment: Alignment.centerLeft ,child: Text("Amount", style: GoogleFonts.amaranth(textStyle: const TextStyle(color: Colors.black, fontSize: 20)),)),
              const SizedBox(height: 10),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  final isDirty = formGroup.control('amount').dirty;
                  final isValidName = formGroup.control('amount').valid;
                  return OutlineReactiveTextField(
                    formControlName: 'amount', label: 'Enter amount',
                    showErrors: (control) => false, keyboardType: TextInputType.number,
                    suffixIcon: (isDirty) ?
                    (isValidName) ? Icons.check_circle : Icons.dangerous
                        : null,
                    suffixIconColor: (isValidName) ? Colors.green : Colors.red,
                  );
                },
              ),
              const SizedBox(height: 20),
              Align( alignment: Alignment.centerRight,
                child: ReactiveFormConsumer(builder: (context, formGroup, child) {
                  final isFormValid = formGroup.valid;
                  return Opacity( opacity: isFormValid ? 1.0 : 0.2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom( backgroundColor: Colors.blue,
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 13.0, bottom: 13.0),
                        side: const BorderSide(color: Colors.black, style: BorderStyle.solid),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                      ),
                      onPressed: isFormValid ? () {
                        // When form is valid, both values are taken and made a list
                        List<String> values = [ getValue('description'),  getValue('amount') ];
                        widget.onSubmitted!(values); // onSubmitted is a function defined in SecondScreen
                        debugPrint("Description: ${getValue('description')} Amount: ${getValue('amount')}");
                        Navigator.pop(context);
                      } : null,
                      child: Text(widget.edit! ? "Edit " : "Add", style: GoogleFonts.amaranth(textStyle: const TextStyle(color: Colors.white, fontSize: 20)),),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Returns a dialog for Delete row feature.
  Widget buildDeleteDialog(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.17, width: MediaQuery.of(context).size.width * 0.80, padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Text("Delete the row?" , style: GoogleFonts.amaranth(textStyle: const TextStyle(color: Colors.black, fontSize: 20)),),
            const SizedBox(height: 20,),
            Align( alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( backgroundColor: Colors.red,
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 13.0, bottom: 13.0),
                  side: const BorderSide(color: Colors.black, style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                ),
                onPressed: () {
                  widget.onDelete!(); // onDelete is a function defined in SecondScreen
                  Navigator.pop(context);
                },
                child: Text("Delete", style: GoogleFonts.amaranth(textStyle: const TextStyle(color: Colors.white, fontSize: 20)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}