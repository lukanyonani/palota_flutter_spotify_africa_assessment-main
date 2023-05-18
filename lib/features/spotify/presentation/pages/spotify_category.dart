import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/grid_widget.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/header_widget.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:get/get.dart';
import '../controllers/spotify_controller.dart';

class SpotifyCategory extends StatefulWidget {
  final String categoryId;

  SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<SpotifyCategory> createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory> {
  final SpotifyController _controller =
      Get.find<SpotifyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            _controller.category.value.name,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                AppColors.blue,
                AppColors.cyan,
                AppColors.green,
              ],
            ),
          ),
        ),
      ),
      //Body starts here
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primary,
          child: Column(
            children: [
              //Heading
              HeaderWidget(),
              //Gridview
              GridWidget(),
              //End of coloumn
            ],
          ),
        ),
      ),
    );
  }
}
