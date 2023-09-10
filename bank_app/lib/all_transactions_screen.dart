import 'package:flutter/material.dart';
import 'package:sil/%C3%B6demeler.dart';
import 'package:sil/basvurular.dart';
import 'package:sil/bireysel_Emeklilik_fonu.dart';
import 'package:sil/doviz_al.dart';
import 'package:sil/doviz_sat.dart';
import 'package:sil/kredi_islemleri.dart';
import 'package:sil/para_transferleri.dart';
import 'package:sil/qr_islemler.dart';
import 'package:sil/search.dart';
import 'package:sil/send_money.dart';
import 'package:sil/settings.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';


class AllTransactionsScreen extends StatelessWidget {

  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tüm İşlemler'),
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
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.send,color: Colors.deepPurple),

            title: const Text('Para Gönder'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendMoney(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment,color: Colors.pink,),
            title: const Text('Ödemeler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.airline_seat_individual_suite_rounded,color: Colors.blueAccent,),
            title: const Text('Bireysel Emeklilik Fonu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IndividualPensionFundsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money,color: Colors.black,),
            title: const Text('Döviz Al'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrencyExchangeScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.money_off,color: Colors.brown,),
            title: const Text('Döviz Sat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrencySellScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_score_sharp,color: Colors.cyan,),
            title: const Text('Kredi İşlemleri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreditOperationsScreen(),
                ),
              );

            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart,color: Colors.indigo,),
            title: const Text('Para Transferleri '),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MoneyTransfersScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book,color: Colors.amberAccent,),
            title: const Text('Başvurular'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ApplicationsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code,color: Colors.green,),
            title: const Text('QR Okut'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRIslem(),
                ),
              );

            },
          ),

        ],
      ),
    );
  }
}



