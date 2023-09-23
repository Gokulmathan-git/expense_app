import 'package:flutter/material.dart';

class GreyContainer extends StatelessWidget {
  const GreyContainer({super.key, this.text, this.amount});
  final String? text;
  final String? amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff91908d),
      ),
      height: 100,
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text!),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(
                  Icons.currency_rupee,
                ),
                Text(
                  "$amount /-",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
