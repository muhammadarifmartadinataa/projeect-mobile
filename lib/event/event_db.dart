import 'dart:convert';

import 'package:project_if22a/config/api.dart';
import 'package:http/http.dart' as http;
import 'package:project_if22a/model/dosen.dart';
import 'package:project_if22a/model/mahsiswa.dart';
import 'package:project_if22a/widget/info.dart';


class EventDb {
  static Future<List<Mahasiswa>> getMahasiswa() async {
    List<Mahasiswa> listMahasiswa = [];

    try {
      var response = await http.get(Uri.parse(Api.getMahasiswa));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var mahasiswa = responBody['mahasiswa'];

          mahasiswa.forEach((mahasiswa) {
            listMahasiswa.add(Mahasiswa.fromJson(mahasiswa));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listMahasiswa;
  }

  static Future<String> AddMahasiswa(
      String npm, String nama, String alamat) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addMahasiswa),
          body: {'text_npm': npm, 'text_nama': nama, 'text_alamat': alamat});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Mahasiswa Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  static Future<void> UpdateMahasiswa(
      String npm, String nama, String alamat) async {
    try {
      var response = await http.post(Uri.parse(Api.updateMahasiswa), body: {
        'text_npm': npm,
        'text_nama': nama,
        'text_alamat': alamat,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Mahasiswa');
        } else {
          Info.snackbar('Berhasil Update Mahasiswa');
        }
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<void> deleteMahasiswa(String npm) async {
    try {
      var response = await http.post(Uri.parse(Api.deleteMahasiswa), body: {
        'text_npm': npm,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Data  Mahasiswa');
        } else {
          Info.snackbar('Berhasil Delete Data Mahasiswa');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //Event DB Dosen
  static Future<List<Dosen>> getDosen() async {
    List<Dosen> listDosen = [];

    try {
      var response = await http.get(Uri.parse(Api.getDosen));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var dosen = responBody['dosen'];

          dosen.forEach((dosen) {
            listDosen.add(Dosen.fromJson(dosen));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listDosen;
  }

  static Future<String> AddDosen(
      String nidn, String nama, String alamat,String prodi) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addDosen),
          body: {'text_nidn': nidn, 'text_nama': nama, 'text_alamat': alamat,'text_prodi': prodi});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Dosen Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  static Future<void> UpdateDosen(
      String nidn, String nama, String alamat, String prodi) async {
    try {
      var response = await http.post(Uri.parse(Api.updateDosen), body: {
        'text_nidn': nidn,
        'text_nama': nama,
        'text_alamat': alamat,
        'text_prodi': prodi,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Dosen');
        } else {
          Info.snackbar('Berhasil Update Dosen');
        }
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<void> deleteDosen(String nidn) async {
    try {
      var response = await http.post(Uri.parse(Api.deleteDosen), body: {
        'text_nidn': nidn,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Data  Dosen');
        } else {
          Info.snackbar('Berhasil Delete Data Dosen');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}