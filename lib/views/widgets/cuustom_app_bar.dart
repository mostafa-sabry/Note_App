import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.icon,
    this.onPressed,
  });
  final String? title;
  final Icon? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: 25.sp,
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(5),
          ),
          child: icon,
        ),
      ],
    );
  }
}
