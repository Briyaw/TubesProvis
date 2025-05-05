import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang berwarna putih
      appBar: AppBar(
        backgroundColor: Colors.white, // Warna AppBar menjadi putih
        elevation: 0, // Hilangkan shadow dari AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[700]), // Ikon kembali berwarna biru
          onPressed: () {
            Navigator.of(context).pop(); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'PayFast',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'PayFast.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 2.0)
                      
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 2.0)
                 
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    labelStyle: TextStyle(color: Colors.blue[700]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 2.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 2.0)
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    labelStyle: TextStyle(color: Colors.blue[700]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                          checkColor: Colors.white, // Warna centang saat aktif
                          activeColor: Colors.blue[700], // Warna latar belakang checkbox saat aktif
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: Colors.blue[700]), // Warna teks "Remember me"
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Aksi lupa password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue[700]), // Warna teks "Forgot Password"
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Lakukan proses login di sini
                      print('Username: ${_usernameController.text}');
                      print('Password: ${_passwordController.text}');
                      if (_rememberMe) {
                        print('Remember me: true');
                      }
                      // Navigasi ke halaman berikutnya
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "don't have an account yet? ",
                      style: TextStyle(color: Colors.grey[700]), // Warna teks
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman buat akun
                      },
                      child: Text(
                        'Create an account',
                        style: TextStyle(color: Colors.blue[700]), // Warna teks
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView( // Agar halaman bisa di-scroll jika kontennya banyak
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBalanceCard(),
              _buildInvestmentBanner(),
              _buildQuickActions(),
              SizedBox(height: 24.0),
              _buildRecentTransactions(),
              _buildFavoriteReceivers(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue[700], // Contoh warna biru
      elevation: 0, // Menghilangkan shadow di bawah AppBar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'PayFast', // Ganti dengan data saldo sebenarnya
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {
            // Aksi ketika tombol notifikasi ditekan
          },
        ),
      ],
    );
  }

 Widget _buildBalanceCard() {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.blue[700],
    ),
    child: Row( 
      children: <Widget>[
        Expanded( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Saldo Anda',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 8),
              Text(
                'Rp 1.200.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Align( 
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.person_pin, color: Colors.white, size: 50.0),
                onPressed: () {
                },
              ),
            ),
            Text('Febri',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
            )
          ],
        ),
      ],
    ),
  );
}

  Widget _buildInvestmentBanner() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50], // Contoh warna background banner
      ),
      padding: EdgeInsets.all(40.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PAYFAST INVEST', // Teks banner
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 9.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'BAGAIMANA CARA INVESTASI', // Teks banner
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Temukan Cara Investasi Mudah di Fastpay!', // Deskripsi banner
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol ditekan
                  },
                  child: Text('Mulai Sekarang!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700], // Warna tombol
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0),
          Transform.translate(
            offset: Offset(0, -46), // Geser ke atas sebanyak 46 piksel
            child: Image.asset(
              "images/invest.png",
              height: 280,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.0),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5, // Sesuaikan dengan jumlah ikon per baris
          children: <Widget>[
            _buildQuickActionItem(Icons.send, 'Transfer'),
            _buildQuickActionItem(Icons.smartphone, 'Pulsa'),
            _buildQuickActionItem(Icons.bolt, 'PLN'),
            _buildQuickActionItem(Icons.water_drop_outlined, 'PDAM'),
            _buildQuickActionItem(Icons.eco, 'VA'),
            _buildQuickActionItem(Icons.inventory, 'eMas'),
            _buildQuickActionItem(Icons.local_police, 'eSamsat'),
            _buildQuickActionItem(Icons.local_offer_outlined, 'Tagihan'),
            _buildQuickActionItem(Icons.star_border, 'Point'),
            // Tambahkan item menu cepat lainnya di sini
            _buildQuickActionItem(Icons.apps, 'Lainnya'),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionItem(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Aksi ketika item menu cepat ditekan
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 30.0, color: Colors.blue[700]),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Transaksi Terakhir',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              TextButton(
                onPressed: () {
                  // Aksi ketika tombol "Lihat Semua" ditekan
                },
                child: Text('Lihat Semua', style: TextStyle(color: Colors.blue[700])),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          // Contoh item transaksi
          _buildTransactionItem(Icons.arrow_downward, 'Rp 23.000', 'Pembayaran QRS ke SaladMoi', 'Keluar', '11.03'),
          _buildTransactionItem(Icons.arrow_downward, 'Rp 143.210', 'Pembayaran QRS ke Recheese', 'Keluar', '11.03'),
          _buildTransactionItem(Icons.arrow_upward, 'Rp 100.000', 'Transfer melalui Bank BCA dari A***B', 'Masuk', '11.03'),
          // Tambahkan item transaksi lainnya di sini (gunakan ListView.builder jika datanya dinamis)
        ],
      ),
    );
  }

  Widget _buildTransactionItem(IconData icon, String amount, String description, String type, String date) {
    final isKeluar = type == 'Keluar';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: isKeluar ? Colors.redAccent : Colors.greenAccent),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(type, style: TextStyle(color: isKeluar ? Colors.redAccent : Colors.greenAccent, fontSize: 12.0)),
              Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
            ],
          ),
        ],
      ),
    );
  }

 Widget _buildFavoriteReceivers() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Hanya padding horizontal
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Penerima Favorit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            TextButton(
              onPressed: () {
                // Aksi ketika tombol "Lihat Semua" ditekan
              },
              child: Text('Lihat Semua', style: TextStyle(color: Colors.blue[700])),
            ),
          ],
        ),
      ),
      SizedBox(height: 12.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Hanya padding horizontal
        child: Column( // Ubah dari Row menjadi Column
          children: <Widget>[
            _buildFavoriteItem('AR***I', 'BANK MANDIRI', '12******'),
            SizedBox(height: 16.0), // Tambahkan jarak antar item
            _buildFavoriteItem('AR***I K***E', 'Bank BRI', '00******2'),
            SizedBox(height: 16.0), // Tambahkan jarak antar item
            _buildFavoriteItem('OP***R IO***T', 'Bank BCA', '09******2'),
            // Tambahkan item penerima favorit lainnya di sini
          ],
        ),
      ),
    ],
  );
}

Widget _buildFavoriteItem(String name, String bank, String accountNumber) {
  return Container(
    width: double.infinity, // Membuat container item selebar mungkin
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow[700], size: 16.0),
            SizedBox(width: 4.0),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Text(bank, style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
        Text(accountNumber, style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
      ],
    ),
  );
}

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Agar semua item terlihat
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Transaksi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'QRIS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
      currentIndex: 0, // Atur indeks item yang aktif
      selectedItemColor: Colors.blue[700],
      unselectedItemColor: Colors.grey[600],
      onTap: (int index) {
        // Aksi ketika item bottom navigation bar ditekan
      },
    );
  }
}

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String? _selectedBank;
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pilih Bank Penerima',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Cari bank penerima',
              ),
              value: _selectedBank,
              items: <String>['BCA', 'BRI', 'BNI']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBank = newValue;
                });
              },
            ),
            SizedBox(height: 24.0),
            Text(
              'Nomor Rekening',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _accountNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Masukkan nomor rekening penerima',
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Nominal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixText: 'Rp ',
                hintText: 'Masukkan nominal transfer',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Icon(
                    _isFavorite ? Icons.star : Icons.star_border,
                    color: Colors.orange[700],
                  ),
                ),
                SizedBox(width: 8.0),
                Text('Tambah sebagai penerima favorit'),
              ],
            ),
            SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi transfer
                  print('Bank Penerima: $_selectedBank');
                  print('Nomor Rekening: ${_accountNumberController.text}');
                  print('Nominal: ${_nominalController.text}');
                  print('Tambah Favorit: $_isFavorite');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[500],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Transfer', style: TextStyle(fontSize: 18.0)),
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: _buildBottomNavigationBar(),
    );
    
    
  }
PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue[700], // Contoh warna biru
      elevation: 0, // Menghilangkan shadow di bawah AppBar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Transaksi',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.white),
          onPressed: () {
            // Aksi ketika tombol notifikasi ditekan
          },
        ),
      ],
    );
  }
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Agar semua item terlihat
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Transaksi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'QRIS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
      currentIndex: 1, // Atur indeks item yang aktif
      selectedItemColor: Colors.blue[700],
      unselectedItemColor: Colors.grey[600],
      onTap: (int index) {
        // Aksi ketika item bottom navigation bar ditekan
      },
    );
  }
  @override
  void dispose() {
    _accountNumberController.dispose();
    _nominalController.dispose();
    super.dispose();
  }
}
class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView( // Agar halaman bisa di-scroll jika kontennya banyak
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                _buildSearchBook(),
                SizedBox(height: 150,),
                 _buildSearchBook2(),
                 SizedBox(height: 150,),
                  _buildSearchBook3(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue[700], // Contoh warna biru
      elevation: 0, // Menghilangkan shadow di bawah AppBar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Transaksi',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.white),
          onPressed: () {
            // Aksi ketika tombol notifikasi ditekan
          },
        ),
      ],
    );
  }

  Widget _buildSearchBook() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Penerima',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
  );


  }

  Widget _buildSearchBook2() {
  return Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/warning.png', // Ganti dengan path gambar aset Anda
          height: 150,
        ),
        SizedBox(height: 20.0),
        Text(
          'Kamu belum memiliki daftar penerima favorit',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
  }
  Widget _buildSearchBook3(BuildContext context) {
  return Padding(
     padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferScreen()),
                  );
                },
                icon: Icon(Icons.add),
                label: Text('Tambah Penerima Baru'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ),
  );
}

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Agar semua item terlihat
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Transaksi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'QRIS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
      currentIndex: 1, // Atur indeks item yang aktif
      selectedItemColor: Colors.blue[700],
      unselectedItemColor: Colors.grey[600],
      onTap: (int index) {
        // Aksi ketika item bottom navigation bar ditekan
      },
    );
  }
}


class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelompok 9'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile( 
            leading: Icon(Icons.login),
            title: Text('Login'),
            subtitle: Text('Halaman ini berisi halaman untuk login untuk masuk aplikasi, halaman ini masih belum bisa menyimpan username dan pw pengguna'),
            onTap: () {
              // Navigasi ke halaman Login
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
             // ScaffoldMessenger.of(context).showSnackBar(
               // SnackBar(content: Text('')),
              //);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('Halaman ini berisi home, fitur yang ada masih belum selesai'),
            onTap: () {
              // Navigasi ke halaman Browsing Resep
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            // ScaffoldMessenger.of(context).showSnackBar(
              //  SnackBar(content: Text('')),
              //);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.handshake),
            title: Text('Transaksi'),
            subtitle: Text('Halaman ini adalah fitur transaksi untuk transfer dan tambah kontak di aplikai, fitur ini juga bleum selesai'),
            onTap: () {
              // Navigasi ke halaman Detail Resep
             Navigator.push(context, MaterialPageRoute(builder: (context) => Transaction()));
             // ScaffoldMessenger.of(context).showSnackBar(
              //  SnackBar(content: Text('Fitur Detail Resep belum terhubung.')),
             // );
            },
          ),
          
        ],
      ),
    );
  }
}

// Contoh