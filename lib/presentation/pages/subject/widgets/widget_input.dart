import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/core/helper/app_text.dart';

class TextFormFieldInput extends StatefulWidget {
  final String hinText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String) onSave;
  final double? getWidth;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldInput({Key? key, required this.hinText, this.keyboardType, required this.controller, required this.onSave, this.getWidth, this.inputFormatters}) : super(key: key);

  @override
  State<TextFormFieldInput> createState() => _TextFormFieldInputState();
}

class _TextFormFieldInputState extends State<TextFormFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.getWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextFormField(
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hinText,
            hintStyle: AppText.textPoppin12.copyWith(
              color: Colors.grey
            ),
            border: InputBorder.none
          ),
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          onSaved: (value){
            widget.controller.text = value!;
          }
        ),
      ),
    );
  }
}

