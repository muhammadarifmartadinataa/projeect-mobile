import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/home_screen.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String _title = '';

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = 'default';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 2,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: _title == 'default'
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  'Hai, ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Asset.colorPrimaryDark,
                                  ),
                                ),
                                Text(
                                  'Muhammad Arif ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Asset.colorPrimaryDark,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Admin',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Asset.colorPrimaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Asset.colorAccent,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage:
                          AssetImage('asset/images/FORMAL3.jpg'),
                          backgroundColor: Asset.colorPrimaryDark,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  _title,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
        ),
        preferredSize: Size.fromHeight(70.0),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Color.fromARGB(150, 255, 159, 159),
          selectedItemColor: Asset.colorPrimary,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "navbar 1",
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              label: "navbar 2",
              icon: Icon(Icons.bar_chart),
            ),
            BottomNavigationBarItem(
              label: "navbar 3",
              icon: Icon(Icons.calendar_today),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),

    );
  }
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'default';
          }
          break;
        case 1:
          {
            _title = 'navbar 1';
          }
          break;
        case 2:
          {
            _title = 'navbar 2';
          }
          break;
        case 3:
          {
            _title = 'navbar 3';
          }
          break;
      }
    });
  }
}
