import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 160, 210, 235),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 30,
              icon: Image.asset('assets/icons/splashlogo.png'),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Center(
            child: Text(
          'Home Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 1.8,
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg')),
                      SizedBox(height: 5,),
                      Text('Rahul Gangwar',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
