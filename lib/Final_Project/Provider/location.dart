import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.red.shade900,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('  Location '),
          backgroundColor: Colors.red.shade900,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                locationMessage,
                style: TextStyle(
                  color: Colors.red.shade900,fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  getCurrentLocation();
                },
                child: Text('Get Location'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          locationMessage = "Latitude: ${position.latitude} \n \nLongitude: ${position.longitude}";
        });
      } catch (e) {
        print(e);
      }
    } else if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Permission Required"),
            content: Text("Please grant location access to use this feature."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
