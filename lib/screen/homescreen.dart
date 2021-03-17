import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_apps/widget/destination_carousel.dart';
import 'package:travel_apps/widget/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
              child: Text(
                'Travel Apps',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            DestinationCarousel(),
            SizedBox(height: 10.0),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 20.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => Navigator.pushNamed(context, '/addHotel')),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUserCircle,
              size: 20.0,
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
