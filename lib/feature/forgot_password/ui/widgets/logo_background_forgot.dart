import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoBackgroundForgotPassword extends StatelessWidget {
  const LogoBackgroundForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7f30fe),
            Color(0xFF6380fb),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
            bottom:
                Radius.elliptical(MediaQuery.of(context).size.width, 105.h)),
      ),
    );
  }
}
