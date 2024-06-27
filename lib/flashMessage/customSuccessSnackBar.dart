import 'package:flutter/material.dart';
class CustomSuccessSnackBar extends StatefulWidget {
  const CustomSuccessSnackBar({super.key});

  @override
  State<CustomSuccessSnackBar> createState() => _CustomSuccessSnackBarState();
}

class _CustomSuccessSnackBarState extends State<CustomSuccessSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.green,
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
                  "Task Complete",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "Success",
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
