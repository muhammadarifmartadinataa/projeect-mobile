import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/dosen.dart';
import 'package:project_if22a/screen/admin/list_dosen.dart';
import 'package:project_if22a/widget/info.dart';

class AddUpdateDosen extends StatefulWidget {
  final Dosen? dosen;
  AddUpdateDosen({this.dosen});

  @override
  State<AddUpdateDosen> createState() => _AddUpdateDosenState();
}

class _AddUpdateDosenState extends State<AddUpdateDosen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNidn = TextEditingController();
  final _controllerNama = TextEditingController();
  final _controllerAlamat = TextEditingController();
  final _controllerProdi = TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    if (widget.dosen != null) {
      _controllerNidn.text = widget.dosen?.nidn ?? '';
      _controllerNama.text = widget.dosen?.nama ?? '';
      _controllerAlamat.text = widget.dosen?.alamat ?? '';
      _controllerProdi.text = widget.dosen?.prodi ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.dosen != null ? 'Update Dosen' : 'Tambah Dosen'),
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
                  enabled: widget.dosen == null,
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerNidn,
                  decoration: InputDecoration(
                    labelText: "NIDN",
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
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerProdi,
                  decoration: InputDecoration(
                    labelText: "Prodi",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      String message;
                      if (widget.dosen == null) {
                        message = await EventDb.AddDosen(
                          _controllerNidn.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerProdi.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNidn.clear();
                          _controllerNama.clear();
                          _controllerAlamat.clear();
                          _controllerProdi.clear();
                          Get.off(ListDosen());
                        }
                      } else {
                        EventDb.UpdateDosen(
                          _controllerNidn.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerProdi.text,
                        );
                        Get.off(ListDosen(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.dosen == null ? 'Simpan' : 'Ubah',
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
