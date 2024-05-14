import 'dart:convert';

import 'package:project_if22a/model/mahsiswa.dart';
import 'package:http/http.dart'as http;
import 'package:project_if22a/config/api.dart';


class  EventDb{
  static Future<List<Mahasiswa>> getMahasiswa() async {
    List<Mahasiswa> listMahasiswa =[];

    try {
      var response = await http.get(Uri.parse(Api.getMahasiswa));
      if (response.statusCode == 200){
        var responBody = jsonDecode(response.body);
      }
    }
    catch(e){
      print(e);
    }

    return listMahasiswa;
  }
  //menambahkan data mahasiswa


}