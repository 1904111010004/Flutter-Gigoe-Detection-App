// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';

// class DatabaseServices {
//   static Future<String> uploadImage(File imageFile) async {
//     String fileName = basename(imageFile.path);

//     StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
//     StorageUploadTask task = ref.putFile(imageFile);
//     StorageTaskSnapshot snapshot = await taks.onComplete;

//     return await snapshot.ref.getDownloadURL();
//   }
// }
