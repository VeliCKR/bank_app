import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sil/login_screen.dart';
import'all_transactions_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 6)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          } else {
            return Center(
              child: Lottie.network(
                'https://lottie.host/a8ed1b16-4aa9-43ce-9ea9-76f400934c82/B8aERujsdz.json',
                repeat: true,
              ),
            );
          }
        },
      ),
    ),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(
        'https://lottie.host/a8ed1b16-4aa9-43ce-9ea9-76f400934c82/B8aERujsdz.json'
    ));
  }
}
class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    // Buraya alt menü sayfalarınızı ekleyin (örneğin, AnaSayfa(), ProfilSayfasi(), vb.).
    const AllTransactionsScreen(),
    // Diğer sayfaları buraya ekleyin
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.business),
            label: 'Tüm İşlemler',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}





