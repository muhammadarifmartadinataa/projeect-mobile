import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/mahsiswa.dart';
import 'package:project_if22a/screen/admin/list_mahasiswa.dart';
import 'package:project_if22a/widget/info.dart';

class AddUpdateMahasiswa extends StatefulWidget {
  final Mahasiswa? mahasiswa;
  AddUpdateMahasiswa({this.mahasiswa});

  @override
  State<AddUpdateMahasiswa> createState() => _AddUpdateMahasiswaState();
}

class _AddUpdateMahasiswaState extends State<AddUpdateMahasiswa> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNpm = TextEditingController();
  final _controllerNama = TextEditingController();
  final _controllerAlamat = TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    if (widget.mahasiswa != null) {
      _controllerNpm.text = widget.mahasiswa?.npm ?? '';
      _controllerNama.text = widget.mahasiswa?.nama ?? '';
      _controllerAlamat.text = widget.mahasiswa?.alamat ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.mahasiswa != null ? 'Update Mahasiswa' : 'Tambah Mahasiswa'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.mahasiswa == null,
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerNpm,
                  decoration: InputDecoration(
                    labelText: "NPM",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerAlamat,
                  decoration: InputDecoration(
                    labelText: "Alamat",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      String message;
                      if (widget.mahasiswa == null) {
                        message = await EventDb.AddMahasiswa(
                          _controllerNpm.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNpm.clear();
                          _controllerNama.clear();
                          _controllerAlamat.clear();
                          Get.off(ListMahasiswa());
                        }
                      } else {
                        // EventDb.UpdateMahasiswa(
                        //   _controllerNpm.text,
                        //   _controllerNama.text,
                        //   _controllerAlamat.text,
                        // );
                      }
                    }
                  },
                  child: Text(
                    widget.mahasiswa == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Asset.colorAccent,
                    fixedSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
