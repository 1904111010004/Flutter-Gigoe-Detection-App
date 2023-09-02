import 'package:flutter/material.dart';
import 'package:gigoe_detection_app/widget/custom_app_bar.dart';
import 'package:gigoe_detection_app/widget/custom_charts.dart';
import 'package:gigoe_detection_app/widget/custom_img_slider.dart';

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
          const CustomCharts()
        ],
      ),
    );
  }
}
