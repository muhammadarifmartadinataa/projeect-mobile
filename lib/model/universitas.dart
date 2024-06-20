class Universitas{
  String? kode_univ;
  String? nama_univ;
  String? alamat_univ;
  String? pos_univ;
  String? kota_univ;

  Universitas({
    this.kode_univ,
    this.nama_univ,
    this.alamat_univ,
    this.pos_univ,
    this.kota_univ,
});
  factory Universitas.fromJson(Map<String, dynamic>json)=> Universitas(
    kode_univ:json['kode_univ'],
    nama_univ:json['nama_univ'],
    alamat_univ:json['alamat_univ'],
    pos_univ:json['pos_univ'],
    kota_univ:json['kota_univ'],
  );

  Map<String, dynamic>toJson() => {
    'kode_univ':kode_univ,
    'nama_univ':nama_univ,
    'alamat_univ':alamat_univ,
    'pos_univ':pos_univ,
    'kota_univ':kota_univ,

  };

}