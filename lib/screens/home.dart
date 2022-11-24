import 'package:flutter/material.dart';
import 'package:tugas_besar/screens/detail1.dart';

class HomePage extends StatelessWidget {
  final List nama = [
    "Ninja 650",
    "Ninja 1000SX",
    "Ninja 125",
    "Ninja 300",
    "Ninja 400",
    "Ninja 650 KRT Edition",
    "Ninja 650 Performance",
    "Ninja H2",
    "Ninja Z H2",
    "Ninja ZX-10R KRT",
    "Ninja ZX-14R ",
    "Ninja ZX-6R KRT",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kawasaki'),
      ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: nama.length,
      itemBuilder: (_, index) {
        return ListTile(
            title: Text(nama[index]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage1(item: nama[index], title: nama[index])));
            });
      },
    );
  }
}
