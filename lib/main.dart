import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), // ganti dari MyHomePage

    );
  }
}

class Mahasiswa {
  String id;
  String nama;
  String telepon;

  Mahasiswa({required this.id, required this.nama, required this.telepon});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _namaController = TextEditingController();
  final _teleponController = TextEditingController();

  final CollectionReference _mahasiswa =
      FirebaseFirestore.instance.collection('mahasiswa');

  void _showForm({Mahasiswa? data}) {
    if (data != null) {
      _namaController.text = data.nama;
      _teleponController.text = data.telepon;
    } else {
      _namaController.clear();
      _teleponController.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(data == null ? 'Tambah Mahasiswa' : 'Edit Mahasiswa'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _teleponController,
              decoration: const InputDecoration(labelText: 'Telepon'),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              final nama = _namaController.text;
              final telepon = _teleponController.text;

              if (data == null) {
                _mahasiswa.add({'nama': nama, 'telepon': telepon});
              } else {
                _mahasiswa.doc(data.id).update({'nama': nama, 'telepon': telepon});
              }

              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _hapus(String id) {
    _mahasiswa.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mahasiswa Firestore')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _mahasiswa.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Text('Terjadi error');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final doc = data[index];
              final mhs = Mahasiswa(
                id: doc.id,
                nama: doc['nama'],
                telepon: doc['telepon'],
              );

              return ListTile(
                title: Text(mhs.nama),
                subtitle: Text(mhs.telepon),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(data: mhs),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _hapus(mhs.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}