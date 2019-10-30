import 'package:flutter/material.dart';
import './awalan.dart';
import './popular.dart';
import './news.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Drawer with Tabs by Mik',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(title: "Test Drawer with Tabs by Mik"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            children:<Widget>[
              // Important: Remove any padding from the ListView.
              UserAccountsDrawerHeader(
                accountName: Text("Mikael Dionito Harbigantara"),
                accountEmail: Text("mikaeldionitoharbigantara@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.android
                  ? Colors.blue
                  : Colors.white,
                  child: Text('Mik...',style: TextStyle(fontSize: 40.0),
                ),
                ),
              ),
              ListTile(
                title: Text('Prambanan'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new FirstPage()));
                },
              ),
              ListTile(
                title: Text('ListView'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new SecondPage()));
                },
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions : <Widget>[],
              title : TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.note)),
                  Tab(icon: Icon(Icons.poll)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
                children: <Widget>[
                  Awalan(),
                  Popular(),
                  News(),
                ]
            ),
          ),
        ));
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(

      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Prambanan Temple',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Prambanan, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),

        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Candi Prambanan terletak di lingkungan Taman Wisata Prambanan, kurang lebih 17 km ke arah timur dari Yogyakarta, tepatnya di Desa Prambanan Kecamatan Bokoharjo. Lokasinya hanya sekitar 100 m dari jalan raya Yogya-Solo, sehingga tidak sulit untuk menemukannya. Sebagian dari kawasan wisata yang yang terletak pada ketinggian 154 m di atas permukaan laut ini termasuk dalam wilayah Kabupaten Sleman. sedangkan sebagian lagi masuk dalam wilayah Klaten',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Prambanan by Mik',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout Prambanan'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/prambanan.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // aturan jika star ditekan maka angka berkurang 1
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
        // aturan jika star ditekan lagi maka angka bertambah 1 ( kembali ke nilai awal)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields
}


class SecondPage extends StatelessWidget {
  var lokasi = [
    {
      'kota': 'Gudeg - Makanan Khas Jogjakarta',
      'img':
      'https://upload.wikimedia.org/wikipedia/commons/3/31/Nasi_Gudeg.jpg'
    },
    {
      'kota': 'Pempek Kapal Selam - Makanan Khas Palembang',
      'img':
      'https://upload.wikimedia.org/wikipedia/commons/0/0e/Pempek_kapal_selam_Bandar_Lampung.JPG'
    },
    {
      'kota': 'Papeda - Makanan Khas Papua',
      'img':
      'https://upload.wikimedia.org/wikipedia/commons/6/68/Papeda%2C_Kuah_Kuning%2C_Ikan_Tude_Bakar_1.jpg'
    },
    {
      'kota': 'Sate Lilit - Makanan Khas Bali',
      'img':
      'https://upload.wikimedia.org/wikipedia/commons/a/ab/Nasi_Campur_Bali_Sate_Lilit.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Makanan Khas Nusantara"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: lokasi.length,
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage('${lokasi[i]['img']}'),
                  ),
                  Text('${lokasi[i]['kota']}')
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

