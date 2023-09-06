import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchDataResults extends StatefulWidget {
  FetchDataResults({Key? key}) : super(key: key);
  @override
  State<FetchDataResults> createState() => _FetchDataResultsState();
}

class _FetchDataResultsState extends State<FetchDataResults> {
  Query dbRef = FirebaseDatabase.instance.ref().child('data');

  late DatabaseReference dbReff;

  @override
  void initState() {
    super.initState();

    dbRef = FirebaseDatabase.instance.ref().child('data');
  }

  Widget listItem({required Map results}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/icons/icon_profile.png'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      results['nama'],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card_rounded,
                          size: 20,
                          color: Color(0xff0E8388),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          results['nik'],
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 20,
                          color: Color(0xff0E8388),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          results['alamat'],
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: double.infinity,
      child: FirebaseAnimatedList(
        query: FirebaseDatabase.instance.ref().child('data_pasien'),
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map results = snapshot.value as Map;
          results['key'] = snapshot.key;

          return listItem(results: results);
        },
      ),
    );
  }
}
