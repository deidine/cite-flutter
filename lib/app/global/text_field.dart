import 'package:cite3/app/global/text_widget.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';

class CheckoutFormWidget extends StatefulWidget {
    CheckoutFormWidget({
    Key? key,
    required this.width,
    required this.label,
    required this.controller,
    required this.hintText,
    this.isImp,
    required this.textInputType,
    this.maxLines,
    this.enabled,
    this.errorText,
    this.suffixIcon, // Added suffixIcon parameter
  }) : super(key: key);

  final double width;
  final TextEditingController controller;
  final String label, hintText;
  final bool? isImp;
  final TextInputType textInputType;
  final int? maxLines;
  final bool? enabled;
  final String? errorText;
  final GestureDetector? suffixIcon; // Added suffixIcon parameter

  @override
  State<CheckoutFormWidget> createState() => _CheckoutFormWidgetState();
}

class _CheckoutFormWidgetState extends State<CheckoutFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomText(
                title: widget.label,
                size: 14.0,
                color: CustomColors.primaryTextColor,
              ),
              const SizedBox(width: 5.0),
              widget.isImp ?? false
                  ? CustomText(
                      title: '*',
                      size: 14.0,
                      color: Colors.red,
                    )
                  : const SizedBox(),
              // Display the suffix icon if provided
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * widget.width,
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.errorText;
              }
              // Add more validation rules if needed
              return null;
            },
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines,
            textCapitalization: TextCapitalization.sentences,
            enabled: widget.enabled ?? true,
            style: GoogleFonts.roboto(
              color: CustomColors.primaryTextColor,
              fontSize: 14.0,
            ),
            cursorColor: CustomColors.primaryTextColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              hintText: widget.hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE9E9E9),
                  width: 1.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3.0,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
