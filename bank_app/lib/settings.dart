import 'package:flutter/material.dart';
import 'package:sil/change_password.dart';
import 'package:sil/login_screen.dart';
import 'package:sil/search.dart';

import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool biometricAuthenticationEnabled = false;
  bool darkModeEnabled = false;
  bool notificationsEnabled2=true;
  bool notificationsEnabled3 = true;
  bool notificationsEnabled4 = true;
  bool notificationsEnabled5 = true;
  bool notificationsEnabled6 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Bildirimleri Etkinleştir'),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Biyometrik Kimlik Doğrulamayı Etkinleştir'),
            value: biometricAuthenticationEnabled,
            onChanged: (value) {
              setState(() {
                biometricAuthenticationEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Karanlık Modu Etkinleştir'),
            value: darkModeEnabled,
            onChanged: (value) {
              setState(() {
                darkModeEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('E-posta Bildirimlerini Etkinleştir'),
            value: notificationsEnabled2,
            onChanged: (value) {
              setState(() {
                notificationsEnabled2 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Güvenlik Ayarları'),
            value: notificationsEnabled3,
            onChanged: (value) {
              setState(() {
                notificationsEnabled3 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('SMS Bildirimleri Etkinleştir'),
            value: notificationsEnabled4,
            onChanged: (value) {
              setState(() {
                notificationsEnabled4 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Oturumu Etkinleştir'),
            value: notificationsEnabled5,
            onChanged: (value) {
              setState(() {
                notificationsEnabled5 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('İki Adımlı Doğrulamayı Etkinleştir'),
            value: notificationsEnabled6,
            onChanged: (value) {
              setState(() {
                notificationsEnabled6 = value;
              });
            },
          ),
          ListTile(
            title: const Text('Şifreyi Değiştir'),
            leading: const Icon(Icons.lock),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Hesabımı Sil'),
            leading: const Icon(Icons.delete),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Hesabınızı Silmek İstediğinize Emin Misiniz ?'),
                    content: const Text('Hesabınız Kalıcı olarak Silinecek !'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Hayır'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Evet'),
                        onPressed: () {
                          // Delete account
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Hesap Silindi'),
                                content: const Text('Hesabınız Başarılı bir şekilde Silinmiştir'),

                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Kapat'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(const MaterialApp(
    home: SettingsScreen(),
  ));
}

