import 'package:flutter/material.dart';

void main() {
  runApp(const KalkulatorSederhana());
}

class KalkulatorSederhana extends StatelessWidget {
  const KalkulatorSederhana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HalamanUtama(),
      debugShowCheckedModeBanner: false
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _Kalkulator();
}

class _Kalkulator extends State<HalamanUtama> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _hasil = "Masukkan angka!";
  double hasil = 0;

  void _hitung(String operasi) {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);
    setState(() {
      if (num1 == null || num2 == null){
        _hasil = "Masukkan angka!";
      }
      else{
        if (operasi == '+') {
          hasil = num1 + num2;
          _hasil = "$hasil";
        } else if (operasi == '-') {
          hasil = num1 - num2;
          _hasil = "$hasil";
        } else if (operasi == '×') {
          hasil = num1 * num2;
          _hasil = "$hasil";
        } else if (operasi == '÷') {
          if (num2 == 0){
            _hasil = "Tidak terdefinisi";
          }
          else {
            hasil = num1/num2;
            _hasil = "$hasil";
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Sederhana')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Angka pertama'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Angka kedua'),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () => _hitung('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => _hitung('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => _hitung('×'), child: const Text('×')),
                ElevatedButton(onPressed: () => _hitung('÷'), child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Hasil: $_hasil',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}