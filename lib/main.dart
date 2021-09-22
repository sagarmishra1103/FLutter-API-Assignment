import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    home: ApiScreen(),
  ));
}

class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List pokemons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    // WE have to write the logic to fetch the data here because
    Dio dio = new Dio();

    var fetchedData = await dio.get("https://pokeapi.co/api/v2/pokemon/");

    setState(() {
      pokemons = fetchedData.data["results"];
    });

    print(pokemons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Demo '),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(pokemons[index]['name']),
                    ))));
  }
}
