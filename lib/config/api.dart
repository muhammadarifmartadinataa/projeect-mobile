class Api {
  static const _host = "http://192.168.170.217/api_project_mobile_if22a";

  static String _mahasiswa = "$_host/mahasiswa";
  static String _dosen = "$_host/dosen";

  //mahasiswa
  static String getMahasiswa = "$_mahasiswa/view.php";
  static String addMahasiswa = "$_mahasiswa/add.php";
  static String updateMahasiswa = "$_mahasiswa/update.php";
  static String deleteMahasiswa = "$_mahasiswa/delete.php";

  //dosen
  static String getDosen = "$_dosen/view.php";
  static String addDosen = "$_dosen/add.php";
  static String updateDosen = "$_dosen/update.php";
  static String deleteDosen = "$_dosen/delete.php";
}