// import 'package:flutter/material.dart';
// import 'package:project_if22a/config/asset.dart';
//
// class ListMahasiswa extends StatefulWidget {
//   const ListMahasiswa({super.key});
//
//   @override
//   State<ListMahasiswa> createState() => _ListMahasiswaState();
// }
//
// class _ListMahasiswaState extends State<ListMahasiswa> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''
//             'Data Mahasiwa ',style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor:Asset.colorPrimary,
//       ),
//       body: Stack(
//         children: [
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: FloatingActionButton(
//               onPressed: (){},
//               child: Icon(Icons.add),
//               backgroundColor: Asset.colorAccent,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({Key? key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  final List<Map<String, String>> students = [
    {'name': 'Muhammad Arif Martadinata', 'major': 'Informatika'},
    {'name': 'Prayogi Setiawan', 'major': 'Teknik Informatika'},
    {'name': 'Faiz Akbar Putra Wardani', 'major': 'Teknik Material'},
    {'name': 'Restu Anggia Putra', 'major': 'Teknik Informatika'},
    // Add more student data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Mahasiswa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Asset.colorPrimaryDark,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 10,top: 10,right: 10),
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white70, // Set card color here
            child: ListTile(
              title: Text(students[index]['name'] ?? ''),
              subtitle: Text(students[index]['major'] ?? ''),
              // Add more info or actions here
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action for adding a new student
        },
        child: Icon(Icons.add),
        backgroundColor: Asset.colorAccent,
      ),
    );
  }
}
