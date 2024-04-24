import 'package:flutter/widgets.dart';

import '../../../../core/themes/text_style.dart';

class LogoForgotAcount extends StatelessWidget {
  const LogoForgotAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Enter Your mail",
        style: TextStyles.font18CustomColorMedium,
      ),
    );
  }
}
