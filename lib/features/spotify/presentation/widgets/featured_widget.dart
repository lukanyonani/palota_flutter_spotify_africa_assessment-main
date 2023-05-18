import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0))),
          width: 342,
          height: 56,
          child: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Featured Artists',
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 22,
              ),
            ),
          ),
        )
      ],
    );
  }
}
