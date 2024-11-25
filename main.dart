import 'package:flutter/material.dart';

void main() { //main method that runs
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget { // widget class MyApp is then a child of StatelessWidget class
  @override
  Widget build(BuildContext context) { //build method. it returns the widget class MaterialApp, which is the child of StatelessWidget.
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Removes the debug banner!!
      title: 'Advanced Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue, //I chnaged this to pink but saw no change
      ),
      home: MainPage(), //ohhh color change makes sense now bc MyApp just displays MainPage it seems.
    );
  }
}

class MainPage extends StatefulWidget { //mutable state, meaning they can change dynamically over time (e.g., in response to user interactions, network updates, or animations
  @override                            //StatefulWidget is a base class in Flutter that represents widgets whose state can change.
  _MainPageState createState() => _MainPageState(); 
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(), //calling HomeScreen class, which is written somewhere below
    ProfileScreen(), 
    SettingsScreen(),
  ];

  @override //this override is inside _MainPageState, which is created in MainPage
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced App'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Welcome to the Home Page!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('<https://via.placeholder.com/150>'),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Flutter Developer'),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Settings Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

