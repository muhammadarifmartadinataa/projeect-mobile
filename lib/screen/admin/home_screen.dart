import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/list_mahasiswa.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Asset.colorPrimary,
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              ),
            ),
            child: Image(
              image: AssetImage('asset/images/header-uti.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25,bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton('Mahasiswa',Icons.people,0),
                    IconButton('Menu 2',Icons.mail,0),
                    IconButton('Menu 3',Icons.folder,0),
                    IconButton('Menu 4',Icons.person_add_alt_1,0),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton('Menu 5',Icons.account_balance_wallet,0),
                    IconButton('Menu 6',Icons.edit_road_outlined,0),
                    IconButton('Menu 7',Icons.people,0),
                    IconButton('Menu 8',Icons.people,0),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10),
            child: Text("Berita Terkini", style: TextStyle(
              color: Asset.colorPrimaryDark,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 170,
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    BeritaTerkini(
                        'https://asset-2.tstatic.net/lampung/foto/bank/images/mahasiswa-Universitas-Teknokrat-Indonesia-lolos.jpg',
                        '70 Mahasiswa Teknokrat Lolos Magang Program Kemendikbudristek',
                        'Jumat, 2 Februari 2024',),
                    BeritaTerkini(
                        'https://asset-2.tstatic.net/lampung/foto/bank/images/Mahasiswa-Program-Studi-S1-Sistem-Informasi-Universitas-Teknokrat.jpg',
                        'Mahasiswa Teknokrat Lolos Program PMM ke Universitas Negeri Gorontalo',
                        'Minggu, 28 Januari 2024',),
                    BeritaTerkini(
                        'https://asset-2.tstatic.net/lampung/foto/bank/images/Sebanyak-20-mahasiswa-yang-dinyatakan-lolos.jpg',
                        '20 Mahasiswa Teknokrat Bakal Kuliah 1 Semester di Universitas Ternama di Indonesia',
                        'Jumat, 12 Januari 2024',),
                    BeritaTerkini(
                        'https://asset-2.tstatic.net/lampung/foto/bank/images/Universitas-Teknokrat-Indonesia-mengadakan-kegiatan-modul-nusantara.jpg',
                        'Showcase Mahasiswa PMM Inbound Universitas Teknokrat Indonesia Berlangsung Sukses',
                        'Selasa, 9 Januari 2024',),
                    BeritaTerkini(
                        'https://asset-2.tstatic.net/lampung/foto/bank/images/Universitas-Teknokrat-Indonesia-Adelia-Putri.jpg',
                        'Showcase Mahasiswa PMM Inbound Universitas Teknokrat Indonesia Berlangsung Sukses',
                        'Selasa, 19 Desember 2023',),
                  ],
                  options: CarouselOptions(
                    height: 170,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [{'title':'Data Mahasiswa','view':ListMahasiswa()}];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _fragment[index]['view'],
                    ),
                  );
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Asset.colorPrimaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
class BeritaTerkini extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  BeritaTerkini(this.img,this.judul,this.tanggal);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Asset.colorPrimaryDark,
                    Colors.transparent,
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // alignment: Alignment(1, 1),
    );
  }
}
