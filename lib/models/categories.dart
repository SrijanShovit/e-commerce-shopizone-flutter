import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories {
  String title;
  IconData icon;

  Categories({
    @required this.title,
    @required this.icon,
  });
}

List<Categories> category_item = [
  Categories(title: 'Keyboard', icon: FontAwesomeIcons.keyboard),
  Categories(title: 'Laptop', icon: FontAwesomeIcons.laptop),
  Categories(title: 'Mobile', icon: FontAwesomeIcons.mobile),
];
