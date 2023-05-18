import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';

String formatWithThousandsSeparator(int value) {
  return value.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]},',
  );
}

class FollowersWidget extends StatelessWidget {
  final int numberOfFollowers;
  FollowersWidget({
    super.key, required this.numberOfFollowers,
  });

  

  @override
  Widget build(BuildContext context) {
    String formattedNumber = formatWithThousandsSeparator(numberOfFollowers);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 195,
        ),
        Container(
          alignment: Alignment.center,
          height: 32,
          width: 195,
          decoration: const BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: Text(
            formattedNumber,
            style: TextStyle(fontFamily: 'Roboto-Medium', fontSize: 11),
          ),
        )
      ],
    );
  }
}
