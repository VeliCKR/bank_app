import 'package:flutter/material.dart';
import 'package:sil/%C3%B6demeler.dart';
import 'package:sil/basvurular.dart';
import 'package:sil/bireysel_Emeklilik_fonu.dart';
import 'package:sil/doviz_al.dart';
import 'package:sil/doviz_sat.dart';
import 'package:sil/kredi_islemleri.dart';
import 'package:sil/para_transferleri.dart';
import 'package:sil/qr_islemler.dart';
import 'package:sil/send_money.dart';
import 'package:sil/settings.dart';
import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> dataList = [
    "Para Gönder",
    "Odemeler",
    "Bireysel Emeklilik Fonu",
    "Döviz Al",
    "Döviz Sat",
    "Kredi İşlemleri",
    "Para Transferleri",
    "Başvurular",
    "QR Okut",
    "Ayarlar",

  ];

  List<String> searchResults = [];

  void searchKeyword(String keyword) {
    setState(() {
      searchResults = dataList
          .where((item) => item.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => searchKeyword(value),
              decoration: const InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]),
                    onTap: () {
                      // ignore: unrelated_type_equality_checks
                      if(searchResults==dataList[0]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SendMoney(),
                          ),
                        );
                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==dataList[1]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentsScreen(),
                          ),
                        );
                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==dataList[2]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IndividualPensionFundsScreen(),
                          ),
                        );

                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==dataList[3]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CurrencyExchangeScreen(),
                          ),
                        );

                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==dataList[4]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CurrencySellScreen(),
                          ),
                        );
                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==dataList[5]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreditOperationsScreen(),
                          ),
                        );
                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==dataList[6]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MoneyTransfersScreen(),
                          ),
                        );
                      }
                      // ignore: unrelated_type_equality_checks
                      else if(searchResults==dataList[7]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ApplicationsScreen(),
                          ),
                        );

                      // ignore: unrelated_type_equality_checks
                      }else if(searchResults==[8]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRIslem(),
                          ),
                        );

                      }
                      // ignore: unrelated_type_equality_checks
                      else if(searchResults==[9]){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );

                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

