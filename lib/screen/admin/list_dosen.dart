import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/dosen.dart';
import 'package:project_if22a/screen/admin/add_update_dosen.dart';
import 'package:project_if22a/screen/admin/add_update_mahasiswa.dart';

class ListDosen extends StatefulWidget {
  const ListDosen({super.key});

  @override
  State<ListDosen> createState() => _ListDosen();
}

class _ListDosen extends State<ListDosen> {
  @override
  List<Dosen> _listDosen = [];

  void getDosen() async {
    _listDosen = await EventDb.getDosen();
    setState(() {});
  }

  @override
  void initState() {
    getDosen();
    super.initState();
  }

  void showOption(Dosen? dosen) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () => Get.back(result: 'update'),
            title: Text('Update'),
          ),
          ListTile(
            onTap: () => Get.back(result: 'delete'),
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    switch (result) {
      case 'update':
        Get.to(AddUpdateDosen(dosen: dosen,))
            ?.then((value) => getDosen());
        break;
      case 'delete':
        EventDb.deleteDosen(dosen!.nidn!).then((value) => getDosen());
        getDosen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Dosen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Asset.colorPrimaryDark,
      ),
      body: Stack(
        children: [
          _listDosen.length > 0
              ? ListView.builder(
            itemCount: _listDosen.length,
            itemBuilder: (context, index) {
              Dosen dosen = _listDosen[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(dosen.nama ?? ''),
                  subtitle: Text(dosen.nidn ?? ''),
                  trailing: IconButton(
                    onPressed: () {
                      showOption(dosen);
                    },
                    icon: Icon(Icons.more_vert),
                  ),
                ),
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
              onPressed: () =>
                  Get.to(AddUpdateDosen())?.then((value) => getDosen()),
              child: Icon(Icons.add),
              backgroundColor: Asset.colorAccent,
            ),
          ),
        ],
      ),
    );
  }
}
