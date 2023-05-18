import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/bindings/spotify_binding.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const PalotaAssessmentApp());
}

class PalotaAssessmentApp extends StatelessWidget {
  const PalotaAssessmentApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palota Spotify Africa Assessment',
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: AppRoutes.startUp,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialBinding: SpotifyBindings(),
    );
  }
}
