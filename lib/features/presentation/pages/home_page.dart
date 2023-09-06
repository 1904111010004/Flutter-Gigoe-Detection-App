import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_charts.dart';
import '../widgets/custom_img_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      body: Stack(
        children: [
          const CustomAppBar(),
          CustomImgSlider(),
          const CustomCharts(),
        ],
      ),
    );
  }
}
