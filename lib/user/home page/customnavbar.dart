import 'package:flutter/material.dart';

class Customnavbar extends StatelessWidget {
  const Customnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.cyan.shade400,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.print,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
