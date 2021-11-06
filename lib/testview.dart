import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              //This exactly likeyour AppBar
              title: Text('helloworld'),
            ),
          ),
          SliverFillRemaining(
              child: //This is exactly like the body which we have for scaffold
                  BottomAppBar(
                      shape: CircularNotchedRectangle(),
                      color: Colors.blue,
                      child: IconTheme(
                        data: IconThemeData(
                            color: Theme.of(context).colorScheme.onPrimary),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              tooltip: 'Open navigation menu',
                              icon: const Icon(Icons.menu),
                              onPressed: () {},
                            ),
                            IconButton(
                              tooltip: 'Search',
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                            IconButton(
                              tooltip: 'Favorite',
                              icon: const Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ))),
        ],
      ),
    );
  }
}
