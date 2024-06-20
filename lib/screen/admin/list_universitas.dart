import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/dosen.dart';
import 'package:project_if22a/model/universitas.dart';
import 'package:project_if22a/screen/admin/add_update_universitas.dart';

class ListUniversitas extends StatefulWidget {
  const ListUniversitas({super.key});

  @override
  State<ListUniversitas> createState() => _ListUniversitas();
}

class _ListUniversitas extends State<ListUniversitas> {
  @override
  List<Universitas> _listUniversitas = [];

  void getUniversitas() async {
    _listUniversitas = await EventDb.getUniversitas();
    setState(() {});
  }

  @override
  void initState() {
    getUniversitas();
    super.initState();
  }

  void showOption(Universitas? universitas) async {
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
        Get.to(AddUpdateUniversitas(universitas: universitas,))
            ?.then((value) => getUniversitas());
        break;
      case 'delete':
        EventDb.deleteUniversitas(universitas!.kode_univ!).then((value) => getUniversitas());
        getUniversitas();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Universitas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Asset.colorPrimaryDark,
      ),
      body: Stack(
        children: [
          _listUniversitas.length > 0
              ? ListView.builder(
            itemCount: _listUniversitas.length,
            itemBuilder: (context, index) {
              Universitas universitas = _listUniversitas[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(universitas.nama_univ ?? ''),
                  subtitle: Text(universitas.kode_univ ?? ''),
                  trailing: IconButton(
                    onPressed: () {
                      showOption(universitas);
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
                  Get.to(AddUpdateUniversitas())?.then((value) => getUniversitas()),
              child: Icon(Icons.add),
              backgroundColor: Asset.colorAccent,
            ),
          ),
        ],
      ),
    );
  }
}
