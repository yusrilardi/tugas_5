import 'package:flutter/material.dart';

class AplikasiSaya extends StatelessWidget {
  const AplikasiSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yusril'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dua Container secara vertikal
            Container(
              color: Colors.red,
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Container 2',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Dua Container secara horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Left',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Right',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
