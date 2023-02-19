// Import class agar dapat menggunakan class Timer Flutter
import 'dart:async';
import 'package:flutter/material.dart';

class TimerClass extends StatefulWidget {
  const TimerClass({super.key});

  @override
  State<TimerClass> createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  // Inisialisasi paramter
  bool timerBerjalan = true;
  int counter = 0;
  Timer? timer;

  // Fungsi menjalankan timer
  void start() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Pengecekan timer
      if (!timerBerjalan) {
        timer.cancel();
      } else {
        setState(() {
          counter++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Timer'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menampilkan angka timer ada layar
            Text(
              '$counter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  // Tombol untuk menghentikan timer
                  child: FloatingActionButton(
                    onPressed: () {
                      timerBerjalan = false;
                      start();
                    },
                    child: const Icon(Icons.stop_circle),
                  ),
                ),
                // Tombol untuk memulai timer
                FloatingActionButton(
                  onPressed: () {
                    timerBerjalan = true;
                    counter = 0;
                    start();
                  },
                  child: const Icon(Icons.play_circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
