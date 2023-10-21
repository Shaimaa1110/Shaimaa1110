import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/Final_Project/View/Screens/Cars_Types/car_id.dart';
import '../../Components/cart1.dart';
import '../Account/user_page.dart';
import '../Home/Booking.dart';
import 'items.dart';

class PagesCars extends StatefulWidget {
  const PagesCars({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _PagesCarsState createState() => _PagesCarsState();
}

class _PagesCarsState extends State<PagesCars> {
  final TextEditingController searchTextController = TextEditingController();
  late List<Item> myList;
  String pageName = '';

  @override
  void initState() {
    super.initState();
    myList = itemslist(widget.id);
    pageName = getPageName(widget.id);
  }

  void _filterItems(String query) {
    setState(() {
      myList = itemslist(widget.id).where((item) {
        final itemName = item.name.toLowerCase();
        return itemName.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(pageName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: searchTextController,
                onChanged: _filterItems, // Call the filter function on text change
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.red.shade900),
                    onPressed: () {
                      searchTextController.clear();
                      _filterItems(''); // Clearing the text also clears the filter
                    },
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.red.shade900),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: myList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = myList[index];
                return Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          item.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(item.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        subtitle: Text("\$ ${item.price.toStringAsFixed(0)}", style: TextStyle(color: Colors.green)),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              cart.add(item);
                            },
                            child: Icon(Icons.add, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/images.jpeg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/img/images.jpeg")),
                  accountEmail: Text("shaimaa@gmail.com"),
                  accountName: Text("Shaimaa",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PagesCars(
                            id: '1',
                          ),
                        ),
                      );
                    }),
                ListTile(
                    title: Text("My Booking"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {}),
                ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {}),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text("", style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PagesCars(
                  id: '1',
                )),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
