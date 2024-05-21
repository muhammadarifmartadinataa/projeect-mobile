import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/mahsiswa.dart';
import 'package:project_if22a/screen/admin/add_update_mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({super.key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<Mahasiswa> _listMahasiswa = [];

  void getMahasiswa() async{
    _listMahasiswa = await EventDb.getMahasiswa();
    setState(() {});
  }
  @override
  void initState(){
    getMahasiswa();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''
            'Data Mahasiswa ',style: TextStyle(color: Colors.white),
        ),
        backgroundColor:Asset.colorPrimaryDark,
      ),
      body: Stack(
        children: [
          _listMahasiswa.length > 0
              ? ListView.builder(
            itemCount: _listMahasiswa.length,
            itemBuilder: (context, index) {
              Mahasiswa mahasiswa = _listMahasiswa[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                  backgroundColor: Colors.white,
                ),
                title: Text(mahasiswa.nama ?? ''),
                subtitle: Text(mahasiswa.npm ?? ''),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.more_vert)),
              );
            },
          )
              : Center(
            child: Text("Data Kosong"),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () => Get.to(AddUpdateMahasiswa())?.then((value) => getMahasiswa()),
              child: Icon(Icons.add),
              backgroundColor: Asset.colorAccent,
            ),
          ),
        ],
      ),
    );
  }
}

