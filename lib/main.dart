import 'package:flutter/material.dart';
import './home.dart';
import './popular.dart';
import './news.dart';

void main() {
  // meload class MyTabs
  runApp(MyTabs());
}

class MyTabs extends StatefulWidget {
  // StatefulWidget berbeda dengan StatelessWidget yang sifat nya statis sehingga tidak dapat di render kembali setelah di load, StatefulWidget sifatnya dinamis sehingga dapat di render kembali saat ketika terdapat event atau user actions
  @override
  MyTabsState createState() => MyTabsState();
  //createState() dari StatefulWidget berfungsi untuk membuat mutable state, dalam hal ini meload class MyTabsState
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin bertujuan membuat animation controller pada tab.

  TabController
      controller; // TabController fungsi nya untuk mengkordinasikan antara TabBar dan TabBarView

  @override
  void initState() {
    super.initState();
    controller = TabController(
        vsync: this, length: 3); //LENGTH = TOTAL TAB YANG AKAN DIBUAT
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My Tabs'),
        backgroundColor: Colors.red[800],
        bottom: TabBar(
          // TabBar kita tempatkan didalam AppBar pada property bottom. TabBar sendiri memiliki beberapa property diantaranya: controller dan tabs. Value dari property controller didapatkan dari variable controller yang telah dibuat pada step kedua. Sedangkan tabs dapat menampung lebih dari satu objek. Karena pada step kedua, length memiliki nilai 3, maka kita akan membuat 3 buah Tab() dimana masing-masing tab memiliki icon yang berbeda.
          controller: controller,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.note),
            ),
            Tab(
              icon: Icon(Icons.poll),
            ),
          ],
        ),
      ),
      body: TabBarView(
        // Pada bagian body yang merupakan property dari Scaffold() , tambahkan Widget TabBarView() untuk menampilkan content dari tab yang sedang aktif. Property dari TabBarView yang akan digunakan adalah controller dengan value variable controller yang telah dibuat sebelumnya, dan children yang berisi custom widget yang akan kita buat setelah ini.
        controller: controller,
        children: <Widget>[Home(), Popular(), News()],
      ),
    ));
  }
}
