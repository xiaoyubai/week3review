import 'package:flutter/material.dart';
import 'package:happynafirsttry/search/SearchList.dart';
import 'package:happynafirsttry/index/IndexList.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    if (!mounted) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabOptions = <Widget>[
      TabBarView(
        children: <Widget>[
          IndexList(mt: 'in_theaters'),
        ],
      ),
      Text(
        'Favorites Tab',
        style: optionStyle,
      ),
      Text(
        'Account Tab',
        style: optionStyle,
      ),
    ];

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchList(),
                    )
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("甜甜"),
                accountEmail: Text("gaoy8910@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/niuniu_tiantian.JPG'),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/tiantian_background.JPG'),
                    )
                ),
              ),
              ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.home),
              ),
              ListTile(
                title: Text('My Orders'),
                trailing: Icon(Icons.info),
              ),
              ListTile(
                title: Text('My Account'),
                trailing: Icon(Icons.input),
              ),
              Divider(),
              ListTile(
                title: Text('Categories'),
                trailing: Icon(Icons.category),
              ),
              ListTile(
                title: Text('Ship To'),
                trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('United States',
                                textAlign: TextAlign.right)),
                        // Container(
                        //   child: Icon(Icons.arrow_right),
                        //   width: 10,
                        // )
                      ],
                    )),
              ),
              ListTile(
                title: Text('currency'),
                trailing: Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                              'USD',
                              textAlign: TextAlign.right,
                            )),
                        Container(
                          child: Icon(Icons.arrow_drop_down),
                          width: 10,
                        )
                      ],
                    )),
              ),
              ListTile(
                title: Text('setting'),
              ),
            ],
          ),
        ),
        body: Container(
          child: _tabOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.redAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}