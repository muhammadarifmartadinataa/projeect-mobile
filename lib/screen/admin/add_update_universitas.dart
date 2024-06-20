import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/mahsiswa.dart';
import 'package:project_if22a/model/universitas.dart';
import 'package:project_if22a/screen/admin/list_mahasiswa.dart';
import 'package:project_if22a/screen/admin/list_universitas.dart';
import 'package:project_if22a/widget/info.dart';

class AddUpdateUniversitas extends StatefulWidget {
  final Universitas? universitas;
  AddUpdateUniversitas({this.universitas});

  @override
  State<AddUpdateUniversitas> createState() => _AddUpdateUniversitasState();
}

class _AddUpdateUniversitasState extends State<AddUpdateUniversitas> {
  final _formKey = GlobalKey<FormState>();
  final _controllerKodeUniv = TextEditingController();
  final _controllerNamaUniv = TextEditingController();
  final _controllerAlamatUniv = TextEditingController();
  final _controllerPosUniv = TextEditingController();
  final _controllerKotaUniv = TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    if (widget.universitas != null) {
      _controllerKodeUniv.text = widget.universitas?.kode_univ ?? '';
      _controllerNamaUniv.text = widget.universitas?.nama_univ ?? '';
      _controllerAlamatUniv.text = widget.universitas?.alamat_univ ?? '';
      _controllerPosUniv.text = widget.universitas?.pos_univ ?? '';
      _controllerKotaUniv.text = widget.universitas?.kota_univ ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.universitas != null ? 'Update Universitas' : 'Tambah Universitas'),
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
                  enabled: widget.universitas == null,
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerKodeUniv,
                  decoration: InputDecoration(
                    labelText: "Kode Univ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerNamaUniv,
                  decoration: InputDecoration(
                    labelText: "Nama Univ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerAlamatUniv,
                  decoration: InputDecoration(
                    labelText: "Alamat Univ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerPosUniv,
                  decoration: InputDecoration(
                    labelText: "Pos Univ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value?.isEmpty == true ? 'Jangan Kosong' : null,
                  controller: _controllerKotaUniv,
                  decoration: InputDecoration(
                    labelText: "Kota Univ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      String message;
                      if (widget.universitas == null) {
                        message = await EventDb.addUniversitas(
                          _controllerKodeUniv.text,
                          _controllerNamaUniv.text,
                          _controllerAlamatUniv.text,
                          _controllerPosUniv.text,
                          _controllerKotaUniv.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerKodeUniv.clear();
                          _controllerNamaUniv.clear();
                          _controllerAlamatUniv.clear();
                          _controllerPosUniv.clear();
                          _controllerKotaUniv.clear();
                          Get.off(ListUniversitas());
                        }
                      } else {
                        EventDb.updateUniversitas(
                          _controllerKodeUniv.text,
                          _controllerNamaUniv.text,
                          _controllerAlamatUniv.text,
                          _controllerPosUniv.text,
                          _controllerKotaUniv.text,
                        );
                        Get.off(ListUniversitas(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.universitas == null ? 'Simpan' : 'Ubah',
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
