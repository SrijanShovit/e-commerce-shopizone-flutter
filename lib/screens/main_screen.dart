import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/app_drawer.dart';
import 'package:ecommerce/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreenPage extends StatefulWidget {
  static const id = '/MainScreenPage';

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  TextEditingController searchC = TextEditingController();
  //getting items from that list into this list
  List<Categories> newList = List.from(category_item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Main Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    textDirection: TextDirection.ltr,
                    controller: searchC,
                    onChanged: (value) {
                      setState(() {
                        searchC.text = value;
                        newList = category_item
                            .where((e) => e.title
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        print(searchC.text);
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Category...',
                        suffixIcon: Icon(FontAwesomeIcons.search)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CSlider(),
              SizedBox(
                height: 20,
              ),
              Text('CATEGORIES',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Column(
                //children set to newList to populate searched list item only
                children: newList
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.purple, Colors.blue])),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(e.title,
                                          style: TextStyle(fontSize: 20))),
                                  Icon(e.icon),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ));
  }
}
