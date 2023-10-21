import 'package:flutter/material.dart';

import '../Home/car_types.dart';
import '../Home/Booking.dart';



class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://ouch-cdn2.icons8.com/kKRJ-99ZSPwUYJ2Vh0yFTBm6q-Txpjn7SLV2onmiMEg/rs:fit:368:403/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjA1/LzEwYzVjYzJhLTY4/OGUtNDAxMi04OWU5/LWU1Y2Q1NjQ4ODg0/Ny5wbmc.png",
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shaimaa", style: TextStyle(fontSize: 20)),
                    Text("shaimaa@gmail.com"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ProfileOption("Edit", Icons.edit, () {}),
          ProfileOption("Shipping", Icons.local_shipping, () {}),
          ProfileOption("Order", Icons.shopping_cart, () {}),
          ProfileOption("Cards", Icons.credit_card, () {}),
          ProfileOption("Notifications", Icons.notifications, () {}),
          ProfileOption("Log Out", Icons.logout, () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red.shade900, // Change the color for the selected item
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
            // Navigate to ItemPage when Home icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarsTypes()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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

class ProfileOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  ProfileOption(this.text, this.icon, this.onPressed);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],

          ),
        ),
      ),
    );
  }
}