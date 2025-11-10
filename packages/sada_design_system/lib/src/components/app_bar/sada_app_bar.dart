import 'package:flutter/material.dart';

class SadaAppBar extends AppBar {
  SadaAppBar({
    super.key,
    required String title,
    super.actions,
    super.leading,
    super.bottom,
  }) : super(
         title: Text(title, style: TextStyle(color: Colors.white)),
         elevation: 0,
       );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
