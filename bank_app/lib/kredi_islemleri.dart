import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';

// Kredi sınıfı
class Credit {
  final String creditName;
  final double creditAmount;
  final double interestRate;
  final int termMonths;

  Credit({
    required this.creditName,
    required this.creditAmount,
    required this.interestRate,
    required this.termMonths,
  });
}

class CreditOperationsScreen extends StatefulWidget {
  const CreditOperationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreditOperationsScreenState createState() => _CreditOperationsScreenState();
}

class _CreditOperationsScreenState extends State<CreditOperationsScreen> {
  List<Credit> credits = [
    Credit(
      creditName: 'Konut Kredisi',
      creditAmount: 150000.0,
      interestRate: 0.79,
      termMonths: 120,
    ),
    Credit(
      creditName: 'Taşıt Kredisi',
      creditAmount: 50000.0,
      interestRate: 0.95,
      termMonths: 36,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kredi İşlemleri'),
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
                          Navigator.of(context).pop(); // Dialog'ı kapat
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Çıkış başarılı!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => LoginScreen()),
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
      body: ListView.builder(
        itemCount: credits.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(credits[index].creditName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tutar: ${credits[index].creditAmount.toStringAsFixed(2)} TL'),
                  Text('Faiz Oranı: ${credits[index].interestRate.toStringAsFixed(2)}%'),
                  Text('Vade: ${credits[index].termMonths} Ay'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                },
                child: const Text('İşlem Yap'),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreditOperationsScreen(),
  ));
}
