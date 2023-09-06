import 'package:flutter/material.dart';

class CustomCharts extends StatefulWidget {
  const CustomCharts({super.key});

  @override
  State<CustomCharts> createState() => _CustomChartsState();
}

class _CustomChartsState extends State<CustomCharts> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 30,
          left: 30,
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.do_disturb_alt_sharp, color: Colors.grey, size: 50),
                // SizedBox(height: 10), // Jarak vertikal antara ikon dan teks
                Text(
                  'No data!', // Ganti dengan teks yang diinginkan
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
