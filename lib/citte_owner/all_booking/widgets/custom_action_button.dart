import 'package:cite3/app/core/themes/font_themes.dart';
import 'package:flutter/material.dart';
 
class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.label,
    required this.onTap,
    required this.textColor,
  }) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (_) => backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(
            
            side: BorderSide(
              width: 23.3,
              color: borderColor,
            ),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: smallText.copyWith(color: textColor),
      ),
    );
  }
}
