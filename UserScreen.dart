import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Map<String, dynamic>? weatherData;
  final Color textHexColor = Color(0xffE0BBA1);

  @override
  void initState() {
    super.initState();
    fetchWeatherData('Vellore'); // Replace 'Chennai' with your desired city
  }

  Future<void> fetchWeatherData(String city) async {
    final apiKey = 'c02db4bb792bc0bf22cda2bd53e7e706'; // Replace with your actual API key
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        weatherData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Welcome to Farm Friend"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: textHexColor,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: WeatherCard(weatherData: weatherData),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: EdgeInsets.all(16.0),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    children: [
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/crop.png', width: 48.0, height: 48.0),
                            const SizedBox(height: 8.0),
                            const Text('Crops'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/fertilizer.png', width: 48.0, height: 48.0),
                            SizedBox(height: 8.0),
                            Text('Fertilizer'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/irrigation-system.png', width: 48.0, height: 48.0),
                            SizedBox(height: 8.0),
                            Text('Irrigator'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic>? weatherData;

  WeatherCard({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    if (weatherData == null) {
      return Container(
        height: 150,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final temperature = weatherData!['main']['temp'];
    final weatherDescription = weatherData!['weather'][0]['description'];
    final humidityStatus = 'Good'; // Replace with actual humidity status
    final soilMoistureStatus = 'Good'; // Replace with actual soil moisture status
    final precipitationStatus = 'Low'; // Replace with actual precipitation status

    return Container(
      width: double.infinity, // Make the contai
      height: 130,// ner span the width of the screen
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/sun.png',width: 38.0, height: 38.0, ),
              Text(
                '${temperature.toInt()}°C',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weatherDescription,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusItem(label: 'Humidity', status: humidityStatus),
              StatusItem(label: 'Soil Moisture', status: soilMoistureStatus),
              StatusItem(label: 'Precipitation', status: precipitationStatus),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String label;
  final String status;

  StatusItem({required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          status,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}