import 'package:flutter/widgets.dart';

import '../../../../core/themes/text_style.dart';

class ForgotpasswordRecoveryText extends StatelessWidget {
  const ForgotpasswordRecoveryText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Password Recovery",
        style: TextStyles.font18CustomColorMedium,
      ),
    );
  }
}
