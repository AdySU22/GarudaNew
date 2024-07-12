import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final Future<void> Function(BuildContext context) onProcess;
  final Color backgroundColor;
  final TextStyle textStyle;
  final String buttonText; 

  AppButton({
    required this.isLoading,
    required this.onProcess,
    this.backgroundColor = AppColors.darkGreen, 
    this.textStyle = AppTextStyles.interWhiteNormal14, 
    required this.buttonText, 
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: backgroundColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 48),
      ),
      onPressed: () async {
        try {
          await onProcess(context);
          // Navigate to the next screen on successful login
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        }
      },
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text(
              buttonText,
              style: textStyle,
            ),
    );
  }
}
