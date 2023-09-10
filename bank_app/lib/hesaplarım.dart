import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

import 'all_transactions_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class BankAccountsPage extends StatefulWidget {
  const BankAccountsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BankAccountsPageState createState() => _BankAccountsPageState();
}

class _BankAccountsPageState extends State<BankAccountsPage> {
  List<BankAccount> _accounts = [];

  @override
  void initState() {
    super.initState();
    _accounts = [
      BankAccount("1234567890", "Hesap Adı 1", 10000.0),
      BankAccount("0987654321", "Hesap Adı 2", 50000.0),
      BankAccount("1234567890", "Hesap Adı 3", 30000.0),
      BankAccount("0987654321", "Hesap Adı 4", 40000.0),
      BankAccount("1234567890", "Hesap Adı 5", 100000.0),
      BankAccount("0987654321", "Hesap Adı 6", 600000.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesaplarım"),
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
                          // Yönlendirme
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text('Çıkış Yap'),
                      ),
                      TextButton(
                        onPressed: () {
                          // İptal butonuna tıklama işlemi
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

      body: ListView.builder(
        itemCount: _accounts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.account_balance), // Hesap simgesi
            title: Text(_accounts[index].name),
            subtitle: Text(_accounts[index].accountNumber),
            trailing: Text("${_accounts[index].balance} TL"),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}

class BankAccount {
  final String accountNumber;
  final String name;
  final double balance;

  BankAccount(this.accountNumber, this.name, this.balance);
}

void main() {
  runApp(const MaterialApp(
    home: BankAccountsPage(),
  ));
}
