import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:sil/home_screen.dart';
import 'package:sil/register.dart';
import 'package:sqflite/sqflite.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final bool _isRegistered = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // Google Sign-In Function
  Future<void> _handleGoogleSignIn() async {
    try {
       GoogleSignInAccount? account = await _googleSignIn.signInSilently();
       account ??= await _googleSignIn.signIn();
      if (account != null) {
         await _handleGoogleSignInWithAccount(account);
         // ignore: unrelated_type_equality_checks
         if(account.authentication == _googleSignIn.signIn()){
         }
       } else {

       }
     } catch (error) {
       if (kDebugMode) {
         print('Google Sign-In Error: $error');
       }
     }
   }
  Future<void> _handleGoogleSignInWithAccount(
      GoogleSignInAccount account) async {
      try {
      await account.authentication.then((authentication) {
        if (kDebugMode) {
          print('Access token: ${authentication.accessToken}');
          print('ID token: ${authentication.idToken}');
          print('Refresh token: ${authentication.accessToken}');

        }
        Navigator.push(
          context as BuildContext,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    } catch (error) {
      if (kDebugMode) {
        print('Google Sign-In Error: $error');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://resmim.net/cdn/2023/07/24/SbfwAI.png',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'E-Mail'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {

                // ignore: no_leading_underscores_for_local_identifiers
                Future<bool> _checkCredentials(String username, String password) async {
                  final databasesPath = await getDatabasesPath();
                  final path = join(databasesPath, "app.db");
                  final Database database = await openDatabase(path);

                  final List<Map<String, dynamic>> users = await database.rawQuery(
                      "SELECT * FROM User WHERE email = ? AND password = ?",
                      [username, password]);

                  await database.close();

                  return users.isNotEmpty;
                }
                String username = _usernameController.text;
                String password = _passwordController.text;
                bool isLoginSuccessful = await _checkCredentials(username, password);

                if(isLoginSuccessful){
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }else {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Hata"),
                        content: const Text("Kullanıcı adı veya şifre hatalı."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Tamam"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Giriş Yap'),
            ),

            if (!_isRegistered)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                  _isRegistered == true;
                },
                child: const Text('Kayıt Ol'),
              ),
            ElevatedButton.icon(
              onPressed: _handleGoogleSignIn,
              icon: Image.network(
                'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                width: 24,
                height: 24,
              ),
              label: const Text('Google ile Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

