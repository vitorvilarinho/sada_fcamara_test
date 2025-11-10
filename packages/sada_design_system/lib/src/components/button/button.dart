import 'package:flutter/material.dart';

class SadaButton extends StatelessWidget {
  const SadaButton({
    required this.label,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00796B),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) ...[leadingIcon!, const SizedBox(width: 8)],
          Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            trailingIcon!,
          ],
        ],
      ),
    );
  }
}
