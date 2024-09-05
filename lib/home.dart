import 'package:flutter/material.dart';
import 'package:task_management_app/screens/profile_page.dart';
import 'package:task_management_app/screens/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    TaskPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.active) {
        //         if (snapshot.hasData) {
        home: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.deepPurple,
            onTap: _onItemTapped,
          ),
        ));
  }
  //           else if (snapshot.hasError) {
  //             return Center(
  //               child: Text('${snapshot.error}'),
  //             );
  //           }
  //         }
  //
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: CircularProgressIndicator(
  //               color: Colors.deepPurple,
  //             ),
  //           );
  //         }
  //
  //         return ;
  //       }),
  // );
}
