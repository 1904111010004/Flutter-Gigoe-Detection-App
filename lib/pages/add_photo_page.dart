import 'package:flutter/material.dart';
import 'package:gigoe_detection_app/widget/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  late ImagePicker _imagePicker;
  final Map<String, File?> _imageFiles = {
    'Gigi Depan': null,
    'Gigi Kanan': null,
    'Gigi Kiri': null,
    'Gigi Atas': null,
    'Gigi Bawah': null,
  };

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _uploadImageFromGallery(String title) async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFiles[title] = File(pickedImage.path);
      }
    });
  }

  Future<void> _takeImageFromCamera(String title) async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _imageFiles[title] = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Text(
          "Tambah Foto",
          style: GoogleFonts.poppins(
              color: const Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xff2E4F4F),
                Color(0xff0E8388),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomNavBar(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: _buildPhotoContainer(
                    'Gigi Depan', 'PHOTO 1 OF 5', _imageFiles['Gigi Depan']),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _buildPhotoContainer(
                    'Gigi Kanan', 'PHOTO 2 OF 5', _imageFiles['Gigi Kanan']),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _buildPhotoContainer(
                    'Gigi Kiri', 'PHOTO 3 OF 5', _imageFiles['Gigi Kiri']),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _buildPhotoContainer(
                    'Gigi Atas', 'PHOTO 4 OF 5', _imageFiles['Gigi Atas']),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _buildPhotoContainer(
                    'Gigi Bawah', 'PHOTO 5 OF 5', _imageFiles['Gigi Bawah']),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoContainer(String title, String subtitle, File? imageFile) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 30,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: 75),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 25,
            right: 25,
            child: Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey[300],
              ),
              child: imageFile != null
                  ? Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported_rounded, size: 30),
            ),
          ),
          Positioned(
            top: 230,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      _uploadImageFromGallery(title);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xffffffff),
                      backgroundColor: const Color(0xff0E8388),
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Icon(Icons.upload_rounded),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _takeImageFromCamera(title);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xffffffff),
                      backgroundColor: const Color(0xff2E4F4F),
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Icon(Icons.photo_camera_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
