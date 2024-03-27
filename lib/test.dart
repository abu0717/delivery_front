import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  Map<String, dynamic> toJson() => {'latitude': latitude, 'longitude': longitude};
}

class LocationService {
  static const String apiUrl = 'http://127.0.0.1:8000/locaiton/'; // Your API endpoint

  static Future<void> sendLocation(Location location) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(location.toJson()),
      );
      if (response.statusCode == 200) {
        print('Location sent successfully');
      } else {
        print('Failed to send location: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending location: $e');
    }
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationSelectionPage(),
    );
  }
}

class LocationSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SendCurrentLocationPage()),
                );
              },
              child: Text('Send Current Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseCustomLocationPage()),
                );
              },
              child: Text('Choose Custom Location'),
            ),
          ],
        ),
      ),
    );
  }
}

class SendCurrentLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Current Location'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
            final currentLocation = Location(latitude: position.latitude, longitude: position.longitude);
            await LocationService.sendLocation(currentLocation);
            Navigator.pop(context);
          },
          child: Text('Send Current Location'),
        ),
      ),
    );
  }
}

class ChooseCustomLocationPage extends StatefulWidget {
  @override
  _ChooseCustomLocationPageState createState() => _ChooseCustomLocationPageState();
}

class _ChooseCustomLocationPageState extends State<ChooseCustomLocationPage> {
  late double _latitude;
  late double _longitude;

  @override
  void initState() {
    super.initState();
    _latitude = 0.0;
    _longitude = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Custom Location'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Latitude: $_latitude',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Longitude: $_longitude',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              setState(() {
                _latitude = position.latitude;
                _longitude = position.longitude;
              });
            },
            child: Text('Use My Current Location'),
          ),
          ElevatedButton(
            onPressed: () {
              // Open a map to choose custom location
              // Here you can navigate to a screen where you can open a map for custom location selection
            },
            child: Text('Choose Custom Location on Map'),
          ),
        ],
      ),
    );
  }
}
