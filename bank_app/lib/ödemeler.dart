import 'package:flutter/material.dart';
import 'package:sil/search.dart';
import 'package:sil/settings.dart';
import 'all_transactions_screen.dart';
import 'hesaplarım.dart';
import 'home_screen.dart';
import 'login_screen.dart';
class Payment {
  final String billName;
  final String billNumber;
  final double amount;
  final DateTime dueDate;

  Payment({
    required this.billName,
    required this.billNumber,
    required this.amount,
    required this.dueDate,
  });
}

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  List<Payment> payments = [
    Payment(
      billName: 'Elektrik Faturası',
      billNumber: '1234567890',
      amount: 500.0,
      dueDate: DateTime(2023, 8, 15),

    ),
    Payment(
      billName: 'Su Faturası',
      billNumber: '9876543210',
      amount: 300.0,
      dueDate: DateTime(2023, 8, 20),
    ),
    Payment(
      billName: 'Doğalgaz Faturası',
      billNumber: '9876543210',
      amount: 1200.0,
      dueDate: DateTime(2023, 8, 20),
    ),
    Payment(
      billName: '2024 YKS Ödemesi',
      billNumber: '9876543210',
      amount: 200.0,
      dueDate: DateTime(2023, 8, 20),
    ),
    Payment(
      billName: '2024 KPSS Ödemesi',
      billNumber: '9876543210',
      amount: 150.0,
      dueDate: DateTime(2023, 8, 20),
    ),
    Payment(
      billName: 'Kredi Ödemesi',
      billNumber: '9876543210',
      amount: 5000.0,
      dueDate: DateTime(2023, 8, 20),
    ),
    Payment(
      billName: 'İnternet Paketi Ödemesi',
      billNumber: '9876543210',
      amount: 300.0,
      dueDate: DateTime(2023, 8, 20),
    ),
    Payment(
      billName: 'Sigorta Ödemesi',
      billNumber: '9876543210',
      amount: 10000.0,
      dueDate: DateTime(2023, 8, 20),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödemeler'),
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
      body: payments.isEmpty
          ? const Center(
        child: Text('Ödenecek bir fatura yok.'),
      )
          : ListView.builder(
        itemCount: payments.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(payments[index].billName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fatura Numarası: ${payments[index].billNumber}'),
                  Text('Tutar: ${payments[index].amount.toStringAsFixed(2)} TL'),
                  Text('Son Ödeme Tarihi: ${payments[index].dueDate.day}/${payments[index].dueDate.month}/${payments[index].dueDate.year}'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Öde'),
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
    home: PaymentsScreen(),
  ));
}
