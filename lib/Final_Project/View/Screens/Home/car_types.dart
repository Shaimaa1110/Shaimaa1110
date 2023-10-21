import 'package:flutter/material.dart';
import '../Account/user_page.dart';
import '../Cars_Types/pages_cars.dart';
import 'Booking.dart';

class Car_Type {
  final String imageUrl;
  final String description;
  final String id;

  Car_Type({required this.imageUrl, required this.description,required this.id});
}

class CarsTypes extends StatefulWidget {

  @override

  _CarsTypesState createState() => _CarsTypesState();
}

class _CarsTypesState extends State<CarsTypes> {
  final List<Car_Type> demoProducts = [
    Car_Type(
      imageUrl: "assets/CarsTypes/ElectricCars.jpg",
      description: "Electric Cars", id: '1',
    ),
    Car_Type(
      imageUrl: "assets/CarsTypes/HybridCars.jpg",
      description: "Hybrid Cars", id: '2',
    ),
    Car_Type(
      imageUrl: "assets/CarsTypes/gasoline.jpg",
      description: "Gasoline Cars", id: '3',
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'Cars Types',

        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: demoProducts.length,
        itemBuilder: (context, index) {
          final product = demoProducts[index];
          return Card(
            color: Colors.grey.shade100,
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {

                      // switch (index) {
                      //   case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PagesCars(
                              id : product.id,
                            )),
                          );
                        //   break;
                        // case 1:
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => ElectricCars(id: '2',)),
                        //   );
                        //   break;
                        // case 2:
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => ElectricCars(id: '3',)),
                        //   );
                        //
                        //   break;
                      },
                //    },
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.red.shade900,
                    ),
                    child: Text(
                      '   View   ',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        },
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
        currentIndex: 0,
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.grey.shade600,
        onTap: (int index) {
          switch (index) {
            case 0:
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
                MaterialPageRoute(builder: (context) => UserPage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
