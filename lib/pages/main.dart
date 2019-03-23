import 'package:demo_app/pages/drawer.dart';
import 'package:demo_app/pages/factory.dart';
import 'package:demo_app/pages/login.dart';
import 'package:demo_app/pages/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        tooltip: 'Add Factory',
      ),
      body: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: <Widget>[
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
                              color: Colors.teal,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Factory 1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0)),
                          /* Text('Images, Videos',
                        style: TextStyle(color: Colors.black45)), */
                        ]),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FactoryPage(id: 1),
                      ),
                    );
                  },
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
                              color: Colors.teal,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Factory 2',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0)),
                          /* Text('Images, Videos',
                        style: TextStyle(color: Colors.black45)), */
                        ]),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FactoryPage(id: 2),
                      ),
                    );
                  },
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
                              color: Colors.teal,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Factory 3',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0)),
                          /* Text('Images, Videos',
                        style: TextStyle(color: Colors.black45)), */
                        ]),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FactoryPage(id: 3),
                      ),
                    );
                  },
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
                              color: Colors.teal,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Factory 4',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0)),
                          /* Text('Images, Videos',
                        style: TextStyle(color: Colors.black45)), */
                        ]),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FactoryPage(id: 4),
                      ),
                    );
                  },
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 160.0),
                StaggeredTile.extent(1, 160.0),
                StaggeredTile.extent(1, 160.0),
                StaggeredTile.extent(1, 160.0),
              ],
            ),
      drawer: drawer(context),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null ? () => onTap() : null,
          child: child),
    );
  }
}
