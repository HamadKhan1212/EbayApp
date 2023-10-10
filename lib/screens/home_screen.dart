import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebayapp/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List images = [
    'images/assets/2.jpg',
    'images/assets/3.jpg',
    'images/assets/4.jpg',
    'images/assets/5.jpg',
    'images/assets/6.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'Eco Buy',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseServices.logOut(context);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal, autoPlay: true),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
