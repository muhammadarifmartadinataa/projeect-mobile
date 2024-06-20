import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_if22a/config/api.dart';
import 'package:project_if22a/event/event_pref.dart';
import 'package:project_if22a/model/dosen.dart';
import 'package:project_if22a/model/mahsiswa.dart';
import 'package:project_if22a/model/universitas.dart';
import 'package:project_if22a/model/user.dart';
import 'package:project_if22a/screen/admin/dashboard_admin.dart';
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
          body: {'npm': npm,
            'nama': nama,
            'alamat': alamat});

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
        'npm': npm,
        'nama': nama,
        'alamat': alamat,
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
      var response = await http
          .post(Uri.parse(Api.deleteMahasiswa), body: {'npm': npm});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Mahasiswa');
        } else {
          Info.snackbar('Gagal Delete Mahasiswa');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //Event DB Dosen
  static Future<List<Dosen>> getDosen() async {
    List<Dosen> ListDosen = [];

    try {
      var response = await http.get(Uri.parse(Api.getDosen));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var dosen = responBody['dosen'];

          dosen.forEach((dosen) {
            ListDosen.add(Dosen.fromJson(dosen));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return ListDosen;
  }

  static Future<String> AddDosen(
      String nidn, String nama, String alamat, String prodi) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addDosen),
          body: {'nidn': nidn,
            'nama': nama,
            'alamat': alamat,
            'prodi': prodi
      });

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
        'nidn': nidn,
        'nama': nama,
        'alamat': alamat,
        'prodi': prodi,
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
      var response = await http
          .post(Uri.parse(Api.deleteDosen), body: {'nidn': nidn});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Dosen');
        } else {
          Info.snackbar('Gagal Delete Dosen');
        }
      }
    } catch (e) {
      print(e);
    }
  }
  //Event DB Universitas
  static Future<List<Universitas>> getUniversitas() async {
    List<Universitas> ListUniversitas = [];

    try {
      var response = await http.get(Uri.parse(Api.getUniversitas));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var universitas = responBody['universitas'];

          universitas.forEach((universitas) {
            ListUniversitas.add(Universitas.fromJson(universitas));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return ListUniversitas;
  }
  static Future<String> addUniversitas(
      String kode_univ, String nama_univ, String alamat_univ, String pos_univ,String kota_univ) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addUniversitas),
          body: {
            'kode_univ': kode_univ,
            'nama_univ': nama_univ,
            'alamat_univ': alamat_univ,
            'pos_univ': pos_univ,
            'kota_univ': kota_univ
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Universitas Berhasil';
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

  static Future<void> updateUniversitas(
      String kode_univ, String nama_univ, String alamat_univ, String pos_univ,String kota_univ) async {
    try {
      var response = await http.post(Uri.parse(Api.updateUniversitas), body: {
        'kode_univ': kode_univ,
        'nama_univ': nama_univ,
        'alamat_univ': alamat_univ,
        'pos_univ': pos_univ,
        'kota_univ': kota_univ,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Universitas');
        } else {
          Info.snackbar('Berhasil Update Universitas');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteUniversitas(String kode_univ) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deleteUniversitas), body: {'kode_univ': kode_univ});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Universitas');
        } else {
          Info.snackbar('Gagal Delete Universitas');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> login(String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'text_username': username,
        'text_pass': pass,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);

        if (responBody['success']) {
          user = User.fromJson(responBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              DashboardAdmin(),
            );
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}