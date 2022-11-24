import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage2 extends StatefulWidget {
  final String item;
  final String title;
  const DetailPage2({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailPage2State createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  var make;
  var model;
  var year;
  var engine;
  var power;
  var type;

  Future getWeather(String motor) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://api.api-ninjas.com/v1/motorcycles?make=honda&model=$motor&year=2022"),
        headers: {'X-Api-Key': 'FXYetTr6CnvCHzaHh0P/qw==mdPtPMbenLwfQYU5'});
    var result = jsonDecode(response.body);
    setState(() {
      this.make = result[0]['make'];
      this.model = result[0]['model'];
      this.year = result[0]['year'];
      this.engine = result[0]['engine'];
      this.power = result[0]['power'];
      this.type = result[0]['type'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(make.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600)),
              ),
              Text(model != null ? model.toString() : "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  year != null ? year.toString() : "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Mesin"),
                  trailing: Text(engine != null
                      ? engine.toString() + "\u00B0"
                      : "Loading"),
                ),
                ListTile(
                  title: Text("power"),
                  trailing: Text(power != null ? power.toString() : "Loading"),
                ),
                ListTile(
                  title: Text("Tipe"),
                  trailing: Text(type != null ? type.toString() : "Loading"),
                ),
                ListTile(
                  title: Text("Tahun"),
                  trailing: Text(year != null ? year.toString() : "Loading"),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
