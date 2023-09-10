import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';

// Başvuru sınıfı
class Application {
  final String name;
  final String idNumber;
  final double amount;
  final String status;

  Application({
    required this.name,
    required this.idNumber,
    required this.amount,
    required this.status,
  });
}

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  List<Application> applications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Başvurular'),
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_box),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Çıkış Yap'),
                    content: const Text('Çıkış yapmak istediğinizden emin misiniz?'),
                    actions: [
                      TextButton(
                        onPressed: () {

                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Çıkış başarılı!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text('Çıkış Yap'),
                      ),
                      TextButton(
                        onPressed: () {

                          Navigator.of(context).pop();
                        },
                        child: const Text('İptal'),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: Colors.deepPurple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Tüm İşlemler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: ("Hesaplarım"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ayarlar",
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllTransactionsScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BankAccountsPage()),
              );

              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );

              break;
            default:
              break;
          }

        },
      ),
      body: applications.isEmpty
          ? const Center(
        child: Text('Henüz başvuru yok.'),
      )
          : ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(applications[index].name),
            subtitle: Text('T.C. Kimlik No: ${applications[index].idNumber}'),
            trailing: Text('${applications[index].amount.toStringAsFixed(2)} TL'),
            leading: CircleAvatar(
              child: Text(applications[index].status),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String name = '';
              String idNumber = '';
              double amount = 0.0;

              return AlertDialog(
                title: const Text('Yeni Başvuru Ekle'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Ad Soyad'),
                      onChanged: (value) => name = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'T.C. Kimlik No'),
                      onChanged: (value) => idNumber = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Miktar'),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => amount = double.tryParse(value) ?? 0.0,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        applications.add(Application(
                          name: name,
                          idNumber: idNumber,
                          amount: amount,
                          status: 'Beklemede',
                        ));
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Ekle'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('İptal'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ApplicationsScreen(),
  ));
}
