import 'package:flutter/material.dart';
import 'package:news_app/helper/country_list.dart';
import 'package:news_app/models/Countrymodel.dart';
import 'package:news_app/screen/homepage.dart';

class CountryPicker extends StatefulWidget {
  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  List<CountryModel> countries = List<CountryModel>();

  @override
  void initState() {
    countries = getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children: <Widget>[
              //Categories
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(countries[index].countryName)));
                        },
                        child: ListTile(
                          leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 64,
                                maxHeight: 64,
                              ),
                              child: Image(
                                image: NetworkImage(
                                    countries[index].countryImageUrl),
                                fit: BoxFit.cover,
                              )),
                          title: Text(
                            countries[index].countryName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
              ),
              //Posts
            ],
          ),
        ),
      ),
    );
  }
}
