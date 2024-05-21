class Api {
  static const _host = "http://192.168.56.1/api_project_mobile_if22a";

  static String _mahasiswa = "$_host/mahasiswa";

  //mahasiswa
  static String getMahasiswa = "$_mahasiswa/view.php";
  static String addMahasiswa = "$_mahasiswa/add.php";
  static String updateMahasiswa = "$_mahasiswa/update.php";
  static String deleteMahasiswa = "$_mahasiswa/delete.php";
}