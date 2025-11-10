import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SadaBackButton extends StatelessWidget {
  const SadaBackButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        'assets/illustrations/back_button.svg',
        package: 'sada_design_system',
      ),
    );
  }
}
