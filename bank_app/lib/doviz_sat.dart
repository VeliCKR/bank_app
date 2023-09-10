import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';

// Döviz sınıfı
class Currency {
  final String name;
  final String code;
  final double exchangeRate;

  Currency({
    required this.name,
    required this.code,
    required this.exchangeRate,
  });
}

class CurrencySellScreen extends StatefulWidget {
  const CurrencySellScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencySellScreenState createState() => _CurrencySellScreenState();
}

class _CurrencySellScreenState extends State<CurrencySellScreen> {
  List<Currency> currencies = [
    Currency(name: 'ABD Doları', code: 'USD', exchangeRate: 26.96),
    Currency(name: 'Euro', code: 'EUR', exchangeRate: 30.04),
    Currency(name: 'İngiliz Sterlini', code: 'GBP', exchangeRate: 34.73),
  ];

  String selectedCurrencyCode = 'USD';
  double amountToSell = 0.0;
  double exchangedAmount = 0.0;

  void sellCurrency() {
    // Döviz satışı hesaplaması
    for (var currency in currencies) {
      if (currency.code == selectedCurrencyCode) {
        exchangedAmount = amountToSell * currency.exchangeRate;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Döviz Satışı'),
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
                MaterialPageRoute(builder: (context) => AllTransactionsScreen()),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCurrencyCode,
              onChanged: (value) {
                setState(() {
                  selectedCurrencyCode = value!;
                });
              },
              items: currencies.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency.code,
                  child: Text('${currency.name} (${currency.code})'),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Satılacak Döviz Birimi Seçin',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  amountToSell = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Satılacak Miktar Girin',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sellCurrency();
                });
              },
              child: const Text('Döviz Sat'),
            ),
            const SizedBox(height: 16),
            Text(
              'TL Hesabınıza Eklenecek Tutar: ${exchangedAmount.toStringAsFixed(2)} TL',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CurrencySellScreen(),
  ));
}
