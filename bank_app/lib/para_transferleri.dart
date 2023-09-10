import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';

// Transfer sınıfı
class Transfer {
  final String recipientName;
  final String recipientAccountNumber;
  final double transferAmount;
  final String description;

  Transfer({
    required this.recipientName,
    required this.recipientAccountNumber,
    required this.transferAmount,
    required this.description,
  });
}

class MoneyTransfersScreen extends StatefulWidget {
  const MoneyTransfersScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoneyTransfersScreenState createState() => _MoneyTransfersScreenState();
}

class _MoneyTransfersScreenState extends State<MoneyTransfersScreen> {
  List<Transfer> transfers = []; // Yapılan transferleri saklamak için bir liste oluşturuyoruz.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Para Transferleri'),
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
                          // Çıkış işlemleri
                          Navigator.of(context).pop(); // Dialog'ı kapat
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
                          Navigator.of(context).pop(); // Dialog'ı kapat
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
      body: transfers.isEmpty
          ? const Center(
        child: Text('Henüz bir para transferi yapmadınız.'),
      )
          : ListView.builder(
        itemCount: transfers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(transfers[index].recipientName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hesap Numarası: ${transfers[index].recipientAccountNumber}'),
                  Text('Tutar: ${transfers[index].transferAmount.toStringAsFixed(2)} TL'),
                  Text('Açıklama: ${transfers[index].description}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MoneyTransfersScreen(),
  ));
}