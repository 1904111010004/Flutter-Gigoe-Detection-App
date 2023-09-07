// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gigoe_detection_app/features/presentation/bloc/classification_bloc.dart';
// import 'package:gigoe_detection_app/features/presentation/bloc/img_response_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ResultDetectionPage extends StatefulWidget {
//   const ResultDetectionPage({super.key});

//   @override
//   State<ResultDetectionPage> createState() => _ResultDetectionPageState();
// }

// class _ResultDetectionPageState extends State<ResultDetectionPage> {
//   List<String> caries = [];
//   List<String> missingTeeth = [];
//   List<String> filling = [];

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     context.select<ClassificationBloc, void>((value) {
//       final state = value.state;
//       if (state is FrontImageClassificationState) {
//         final front = state.data.predictions;
//         if (front != null) {
//           setState(() {
//             caries = front
//                 .where((e) => e.predictionClass == 'Karies')
//                 .map((e) => e.predictionClass)
//                 .toList()
//                 .cast<String>();
//             missingTeeth = front
//                 .where((e) => e.predictionClass == 'Hilang')
//                 .map((e) => e.predictionClass)
//                 .toList()
//                 .cast<String>();
//             filling = front
//                 .where((e) => e.predictionClass == 'Tambal')
//                 .map((e) => e.predictionClass)
//                 .toList()
//                 .cast<String>();
//           });
//         }
//       }
//     });

//     return Scaffold(
//       backgroundColor: const Color(0xffCBE4DE),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 100,
//         title: Text(
//           "Hasil Deteksi",
//           style: GoogleFonts.poppins(
//               color: const Color(0xffffffff),
//               fontSize: 20,
//               fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xff2E4F4F),
//                 Color(0xff0E8388),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//         leading: const SizedBox(),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: CarouselSlider(
//               items: [
//                 BlocBuilder<ImgResponseBloc, ImgResponseState>(
//                   builder: (context, state) {
//                     print(state);
//                     if (state is ImgResponseFrontData) {
//                       return ResultDetectionCard(
//                         imageBytes: state.imgUint8List,
//                         caries: caries.length,
//                         filledTooth: filling.length,
//                         missingTooth: missingTeeth.length,
//                         title: "Gigi Depan",
//                         subtitle: "PHOTO 1 OF 5",
//                       );
//                     }
//                     return const ResultDetectionLoading();
//                   },
//                 ),
//                 BlocBuilder<ImgResponseBloc, ImgResponseState>(
//                   builder: (context, state) {
//                     if (state is ImgResponseRightData) {
//                       return ResultDetectionCard(
//                         imageBytes: state.imgUint8List,
//                         caries: caries.length,
//                         filledTooth: filling.length,
//                         missingTooth: missingTeeth.length,
//                         title: "Gigi Kanan",
//                         subtitle: "PHOTO 2 OF 5",
//                       );
//                     }
//                     return const ResultDetectionLoading();
//                   },
//                 ),
//                 BlocBuilder<ImgResponseBloc, ImgResponseState>(
//                   builder: (context, state) {
//                     if (state is ImgResponseLeftData) {
//                       return ResultDetectionCard(
//                         imageBytes: state.imgUint8List,
//                         caries: caries.length,
//                         filledTooth: filling.length,
//                         missingTooth: missingTeeth.length,
//                         title: "Gigi Kiri",
//                         subtitle: "PHOTO 3 OF 5",
//                       );
//                     }
//                     return const ResultDetectionLoading();
//                   },
//                 ),
//                 BlocBuilder<ImgResponseBloc, ImgResponseState>(
//                   builder: (context, state) {
//                     if (state is ImgResponseUpperData) {
//                       return ResultDetectionCard(
//                         imageBytes: state.imgUint8List,
//                         caries: caries.length,
//                         filledTooth: filling.length,
//                         missingTooth: missingTeeth.length,
//                         title: "Gigi Atas",
//                         subtitle: "PHOTO 4 OF 5",
//                       );
//                     }
//                     return const ResultDetectionLoading();
//                   },
//                 ),
//                 BlocBuilder<ImgResponseBloc, ImgResponseState>(
//                   builder: (context, state) {
//                     if (state is ImgResponseLowerData) {
//                       return ResultDetectionCard(
//                         imageBytes: state.imgUint8List,
//                         caries: caries.length,
//                         filledTooth: filling.length,
//                         missingTooth: missingTeeth.length,
//                         title: "Gigi Bawah",
//                         subtitle: "PHOTO 5 OF 5",
//                       );
//                     }
//                     return const ResultDetectionLoading();
//                   },
//                 ),
//               ],
//               options: CarouselOptions(
//                 height: height * 0.44,
//                 disableCenter: true,
//                 initialPage: 0,
//                 autoPlay: false,
//                 autoPlayInterval: const Duration(seconds: 5),
//                 enlargeCenterPage: true,
//                 enableInfiniteScroll: true,
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 36),
//             child: ResultoverallConditionCard(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class ResultDetectionCard extends StatelessWidget {
//   const ResultDetectionCard({
//     super.key,
//     this.caries = 0,
//     this.missingTooth = 0,
//     this.filledTooth = 0,
//     required this.imageBytes,
//     required this.title,
//     required this.subtitle,
//   });

//   final int caries;
//   final int missingTooth;
//   final int filledTooth;
//   final Uint8List? imageBytes;

//   final String title;
//   final String subtitle;

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       width: 320,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 subtitle,
//                 style: GoogleFonts.poppins(),
//               )
//             ],
//           ),
//           const SizedBox(height: 10),
//           Container(
//             height: height * 0.22,
//             width: 300,
//             decoration: BoxDecoration(
//               color: Colors.black12,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: imageBytes != null
//                 ? ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.memory(
//                       imageBytes!,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                 : const SizedBox(),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             "Kondisi Gigi",
//             style: GoogleFonts.poppins(),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Gigi Karies ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "Gigi Hilang ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "Gigi Tambal ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     caries.toStringAsFixed(0),
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     missingTooth.toStringAsFixed(0),
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     filledTooth.toStringAsFixed(0),
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class ResultoverallConditionCard extends StatelessWidget {
//   const ResultoverallConditionCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Kondisi keselurahan Gigi Pasien",
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Total Gigi Karies ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "Total Gigi Hilang ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "Total Gigi Tambal ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "0",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "0",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "0",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class ResultDetectionLoading extends StatelessWidget {
//   const ResultDetectionLoading({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       width: 320,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "Gigi Depan",
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 "PHOTO 0 OF 0",
//                 style: GoogleFonts.poppins(),
//               )
//             ],
//           ),
//           const SizedBox(height: 10),
//           Container(
//               height: height * 0.22,
//               width: 300,
//               decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.black45,
//                 ),
//               )),
//           const SizedBox(height: 10),
//           Text(
//             "Kondisi Gigi",
//             style: GoogleFonts.poppins(),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Gigi Karies ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "Gigi Hilang ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "Gigi Tambal ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     ":  ",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "0",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "0",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   Text(
//                     "0",
//                     style: GoogleFonts.poppins(),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
