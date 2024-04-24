import 'package:flutter/material.dart';

import '../../../../core/themes/text_style.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign In',
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}


//