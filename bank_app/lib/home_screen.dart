import 'package:flutter/material.dart';
import 'package:sil/all_transactions_screen.dart';
import 'package:sil/hesaplar%C4%B1m.dart';
import 'package:sil/login_screen.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';

void _logoutAndRedirect(BuildContext context) {

  // Çıkış başarılı mesajı göstermek için Snackbar kullanıyoruz.
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
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final stateWhere = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Mobil'),
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

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        children: [
          const Text(
            'Kartlarım',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return CardWidget(index: index);

              },
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'IBAN',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Text(
              'TR12 3456 7890 1234 5678 9012',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(thickness: 1, color: Colors.grey),
          const Text(
            'Bakiye',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '₺5,600.00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(thickness: 1, color: Colors.grey),
          const Text(
            'Son İşlemler',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {

              return ListTile(
                title: Text('İşlem ${index + 1}'),
                subtitle: const Text('Migros'),
                trailing: const Text('-₺250.00'), // Örnek işlem miktarı
              );
            },
          ),
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
    );
  }

}

class CardWidget extends StatelessWidget {
  final int index;


  const CardWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final List<String> cardImages = [
      'https://cdn.pixabay.com/photo/2020/09/17/22/47/bank-card-5580506_960_720.png',
      'https://media.istockphoto.com/id/1494518821/vector/credit-card-payment-vector-illustration.webp?b=1&s=612x612&w=0&k=20&c=DlFp_tkFgDqt61JLXf7-tAR59t0OvZS2R_3Chl9euKE=',
      'https://media.istockphoto.com/id/1427330624/tr/vekt%C3%B6r/3d-credit-card-secure-payment-with-chackmark-money-financial-security-for-online-shopping.jpg?s=612x612&w=0&k=20&c=W81dChFW-98LphlzA2ypRTqTf3NPpJPQ48N4HT8g-xM=',
      'https://media.istockphoto.com/id/868808772/tr/vekt%C3%B6r/kredi-kart%C4%B1-simge-vekt%C3%B6r.jpg?s=612x612&w=0&k=20&c=npVFcG_75bVdWXvwHnWHWnf7VrMNILApHEceHWEw6p4=',
    ];
    final List<String> cardTitles = ['Kart A', 'Kart B', 'Kart C', 'Kart D'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              cardImages[index % cardImages.length],
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              cardTitles[index % cardTitles.length],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



