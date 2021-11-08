import 'package:ecommerce/adminScreens/addProduct.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
          child: ListView(
        children: [
          drawerHeader(),
          drawerItems('Home Page', FontAwesomeIcons.home, () {
            Navigator.pushReplacementNamed(context, MainScreenPage.id);
          }),
          drawerItems('Admin Page', FontAwesomeIcons.user, () {
            Navigator.pushReplacementNamed(context, AddProductPage.id);
          }),
        ],
      )),
    );
  }

  ListTile drawerItems(String title, IconData icon, GestureTapCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class drawerHeader extends StatelessWidget {
  const drawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.all(0.0),
      child: Container(
        color: primaryColor,
        child: Center(
          child: Text('WELCOME TO SHOPIZONE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              )),
        ),
      ),
    );
  }
}
