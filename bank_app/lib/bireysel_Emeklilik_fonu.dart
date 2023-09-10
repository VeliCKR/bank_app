import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class IndividualPensionFund {
  final String fundName;
  final String fundType;
  final double balance;
  final double yearlyInterestRate;

  IndividualPensionFund({
    required this.fundName,
    required this.fundType,
    required this.balance,
    required this.yearlyInterestRate,
  });
}

class IndividualPensionFundsScreen extends StatefulWidget {
  const IndividualPensionFundsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IndividualPensionFundsScreenState createState() =>
      _IndividualPensionFundsScreenState();
}

class _IndividualPensionFundsScreenState
    extends State<IndividualPensionFundsScreen> {
  List<IndividualPensionFund> pensionFunds = [
    IndividualPensionFund(
      fundName: 'Emeklilik Fonu A',
      fundType: 'Değişken Fon',
      balance: 10000.0,
      yearlyInterestRate: 8.0,
    ),
    IndividualPensionFund(
      fundName: 'Emeklilik Fonu B',
      fundType: 'Sabit Fon',
      balance: 15000.0,
      yearlyInterestRate: 6.5,
    ),
    IndividualPensionFund(
      fundName: 'Emeklilik Fonu C',
      fundType: 'Değişken Fon',
      balance: 20000.0,
      yearlyInterestRate: 6.0,
    ),
    IndividualPensionFund(
      fundName: 'Emeklilik Fonu D',
      fundType: 'Değişken Fon',
      balance: 30000.0,
      yearlyInterestRate: 4.0,
    ),
    IndividualPensionFund(
      fundName: 'Emeklilik Fonu E',
      fundType: 'Değişken Fon',
      balance: 17000.0,
      yearlyInterestRate: 5.0,
    ),
    IndividualPensionFund(
      fundName: 'Emeklilik Fonu F',
      fundType: 'Değişken Fon',
      balance: 25000.0,
      yearlyInterestRate: 9.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bireysel Emeklilik Fonları'),
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
      body: pensionFunds.isEmpty
          ? const Center(
        child: Text('Henüz bir emeklilik fonu yok.'),
      )
          : ListView.builder(
        itemCount: pensionFunds.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(pensionFunds[index].fundName),
              subtitle: Text(pensionFunds[index].fundType),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${pensionFunds[index].balance.toStringAsFixed(2)} TL',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Yıllık Faiz Oranı: ${pensionFunds[index].yearlyInterestRate}%',
                  ),
                ],
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
    home: IndividualPensionFundsScreen(),
  ));
}
