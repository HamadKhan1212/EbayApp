import 'package:ebayapp/widgets/app_style.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final bool? isLoading;
  final String? buttonTitle;
  final BorderRadius? radius;
  final Color color;
  final double? height;
  final double? width;
  final VoidCallback? nextScreen;
  const ReusableButton(
      {super.key,
      this.buttonTitle,
      this.radius,
      this.color = Colors.teal,
      this.height,
      this.width,
      this.nextScreen,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: nextScreen,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(borderRadius: radius, color: color),
        child: Center(
            child: Stack(
          children: [
            Visibility(
              visible: isLoading! ? false : true,
              child: Text(
                buttonTitle ?? 'Button',
                style: AppStyle.textStyle
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
                visible: isLoading!, child: const CircularProgressIndicator()),
          ],
        )),
      ),
    );
  }
}
