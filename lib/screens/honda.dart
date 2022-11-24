import 'package:flutter/material.dart';
import 'package:tugas_besar/screens/detail2.dart';

class HondaPage extends StatelessWidget {
  final List nama = [
    "Beat Street",
    "PCX160",
    "CBR150R",
    "CBR300R",
    "ADV150",
    "Ace 125",
    "ADV350",
    "Activa",
    "Africa Twin Adventure Sports",
    "AirBlade 150",
    "Benly",
    "CB1000R",
    "CB500F",
    "CBR1000RR-R Fireblade",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Honda'),
      ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: nama.length,
      itemBuilder: (_, index) {
        return ListTile(
            title: Text(nama[index]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage2(item: nama[index], title: nama[index])));
            });
      },
    );
  }
}
