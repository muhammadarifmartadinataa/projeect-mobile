class Api {
  static const _host = "http://192.168.40.217/api_project_mobile_if22a";

  static String _mahasiswa = "$_host/mahasiswa";
  static String _dosen = "$_host/dosen";
  static String _universitas = "$_host/universitas";
  static String login = "$_host/login.php";

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

  //universitas
  static String getUniversitas = "$_universitas/view.php";
  static String addUniversitas = "$_universitas/add.php";
  static String updateUniversitas = "$_universitas/update.php";
  static String deleteUniversitas = "$_universitas/delete.php";
}