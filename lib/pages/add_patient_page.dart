import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBE4DE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: const Text("Tambah Pasien"),
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
      ),
      body: const Center(
        child: Text('Konten Halaman Utama Anda'),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:date_time_picker/date_time_picker.dart';

// class AddPatient extends StatefulWidget {
//   const AddPatient({Key? key}) : super(key: key);

//   @override
//   State<AddPatient> createState() => _AddPatientState();
// }

// class _AddPatientState extends State<AddPatient> {
//   final TextEditingController _nikController = TextEditingController();
//   final TextEditingController _namaController = TextEditingController();
//   final TextEditingController _lahirController = TextEditingController();
//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _pekerjaanController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _nomorController = TextEditingController();

//   String _selectedGender = 'Laki-laki';

//   get firestore => null;

//   @override
//   void dispose() {
//     _nikController.dispose();
//     _namaController.dispose();
//     _lahirController.dispose();
//     _alamatController.dispose();
//     _pekerjaanController.dispose();
//     _emailController.dispose();
//     _nomorController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffCBE4DE),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 100,
//         title: const Text("Tambah Pasien"),
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
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildInputField("NIK", TextInputType.number, _nikController),
//               _buildInputField(
//                   "Nama Pasien", TextInputType.text, _namaController),
//               _buildDateField("Tanggal Lahir", _lahirController),
//               _buildInputField("Alamat", TextInputType.text, _alamatController),
//               _buildGenderDropdown("Jenis Kelamin"),
//               _buildInputField(
//                   "Pekerjaan", TextInputType.text, _pekerjaanController),
//               _buildInputField(
//                   "Email", TextInputType.emailAddress, _emailController),
//               _buildInputField(
//                   "Nomor Handphone", TextInputType.number, _nomorController),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildButton("Batal", const Color(0xffD90000), 130, 50, () {
//                     _resetControllers();
//                   }),
//                   _buildButton(
//                       "Simpan", const Color(0xff2E4F4F), 130, 50, () {}),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(String hintText, TextInputType inputType,
//       TextEditingController controller) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             hintText,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.normal,
//             ),
//           ),
//           SizedBox(
//             height: 50,
//             child: TextFormField(
//               controller: controller,
//               keyboardType: inputType,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.all(10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(width: 2, color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDateField(String hintText, TextEditingController controller) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             hintText,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.normal,
//             ),
//           ),
//           DateTimePicker(
//             type: DateTimePickerType.date,
//             controller: _lahirController,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.all(10),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(
//                   width: 2,
//                   color: Colors.black,
//                 ),
//               ),
//               suffixIcon: const Icon(Icons.calendar_today),
//             ),
//             dateMask: 'dd/MM/yyyy',
//             // initialValue: '',
//             firstDate: DateTime(1900),
//             lastDate: DateTime(2101),
//             onChanged: (val) {},
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Tanggal tidak boleh kosong';
//               }
//               return null;
//             },
//             onSaved: (val) {},
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGenderDropdown(String hintText) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             hintText,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.normal,
//             ),
//           ),
//           SizedBox(
//             height: 50,
//             child: DropdownButtonFormField<String>(
//               value: _selectedGender,
//               items: <String>['Laki-laki', 'Perempuan'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedGender = newValue!;
//                 });
//               },
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.all(10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     width: 2,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(
//     String text,
//     Color color,
//     double width,
//     double height,
//     Function()? onPressed,
//   ) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: Text(text),
//       ),
//     );
//   }

//   void _resetControllers() {
//     _nikController.clear();
//     _namaController.clear();
//     _lahirController.clear();
//     _alamatController.clear();
//     _pekerjaanController.clear();
//     _emailController.clear();
//     _nomorController.clear();
//   }
// }
