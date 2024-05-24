import 'package:flutter/material.dart';
class CustomSnackBar extends StatelessWidget {
  final errorMsg;

  const CustomSnackBar({
    super.key,
    required this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 70,
      decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(20)),

      ),
      child: Row(
        children: [
          const SizedBox(width: 48,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Error Encountered!",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  errorMsg,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
