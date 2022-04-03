import 'package:flutter/material.dart';
import 'package:guestay/shared/bottom_navigation_bar.dart';
import 'package:guestay/shared/appbar.dart';
import 'package:guestay/shared/constants/background.dart';

List<String> destinations = ['Greece', 'Iceland', 'Ireland', 'Italy', 'Morawy'];

class SessionView extends StatelessWidget {
  SessionView({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: defaultBottomNavigationBar,
        body: Container(
            decoration: backgroundDecoration,
            width: 1000,
            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: [
                _searchBar(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Discover hotels in top destinations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                SizedBox(height: 150, child: destinationsBuilder),
              ],
            )));
  }

  ListView destinationsBuilder = ListView.builder(
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: destinations.length,
    itemBuilder: (BuildContext context, int index) =>
        Stack(alignment: Alignment.bottomCenter, children: [
      Card(
        // elevation: 20,
        child: SizedBox(
          width: 150,
          // height: 20,
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('You chose ${destinations.elementAt(index)}'),
              ));
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Center(
                    child: Image.asset(
                  'assets/images/${destinations.elementAt(index).toLowerCase()}.jpg',
                  // width: 150,
                  // height: 300,
                ))),
          ),
        ),
      ),
      Material(
        elevation: 20,
        child: Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.blue,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ], borderRadius: BorderRadius.circular(30), color: Colors.blue),
            child: Center(
              child: Text(
                destinations.elementAt(index),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
    ]),
  );
  Widget _searchBar() {
    return Container(
      // color: Colors.blue,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.blue),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
            // constraints: BoxConstraints(maxWidth: 250),
            hintText: 'Search...',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
