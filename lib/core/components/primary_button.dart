import 'package:flutter/material.dart';

import '../extension/build_extension.dart';
import '../theme/app_color.dart';
import '../theme/app_text_style.dart';

class CustomPrimaryButton extends StatefulWidget {
  final String description;
  final double? buttonHeight;
  final Color? textColor;
  final Color? customButtonColor;
  final VoidCallback onPressed;
  CustomPrimaryButton({
    Key? key,
    required this.description,
    this.buttonHeight = 56,
    this.textColor = Colors.white,
    Color? customButtonColor,
    required this.onPressed,
  })  : customButtonColor = (customButtonColor != null ? customButtonColor : AppColorStyle.instance.samphireGreen),
        super(key: key);

  @override
  State<CustomPrimaryButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.customButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: context.buttonRadius,
          ),
        ),
        // ignore: sort_child_properties_last
        child: Text(
          widget.description,
          style: AppTextStyle.instance.semiBold13TextStyle,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
