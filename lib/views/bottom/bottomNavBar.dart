import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AddNewPage(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1),
        onPressed: () {
          _onItemTapped(1);
        },
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 58,
          color: _currentIndex == 1 ? Colors.yellow : Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromRGBO(82, 170, 94, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.10,
              ),
              onPressed: () {
                _onItemTapped(0);
              },
              icon: Icon(
                Icons.list,
                size: 38,
                color: _currentIndex == 0 ? Colors.yellow : Colors.black,
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.10,
              ),
              onPressed: () {
                _onItemTapped(2);
              },
              icon: Icon(
                Icons.person,
                size: 38,
                color: _currentIndex == 2 ? Colors.yellow : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

class AddNewPage extends StatelessWidget {
  const AddNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Page Screen'),
      ),
      body: const Center(
        child: Text('Add New Page Screen'),
      ),
    );
  }
}
