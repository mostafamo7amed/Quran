import 'package:flutter/material.dart';
import 'package:quran/core/widgets/adaptive_layout.dart';
import 'package:quran/features/prayer/views/mobile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const MobileView(),
        tabletLayout: (context) => const MobileView(),
        desktopLayout: (context) => const MobileView(),
      ),
      
    );
  }
}
