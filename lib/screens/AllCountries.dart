import 'package:country_house/screens/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List> countries;
  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    getCountries();
    return Scaffold(
        appBar: AppBar(
          title: Text("All Countries"),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: FutureBuilder<List>(
              future: countries,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Country(snapshot.data[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            snapshot.data[index]['name'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    );
                  });
                }
                return null;
              },
            )));
  }
}
