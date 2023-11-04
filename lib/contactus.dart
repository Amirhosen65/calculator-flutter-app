import 'package:flutter/material.dart';

class contactus extends StatefulWidget {
  const contactus({Key? key}) : super(key: key);

  @override
  _contactusState createState() => _contactusState();
}

class _contactusState extends State<contactus> {
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        children: [
          SizedBox(height: 5,),
          Card(
            elevation: 8,
            child: Container(
              width: size.width*1.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 75,
                    width: size.width*1.0,
                  ),
                  Positioned(
                    top: 8,
                    left: 5,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("images/amir.jpg"),

                    ),
                  ),
                  Positioned(
                    top: 22,
                    left: 90,
                    child: Column(
                      children: [
                        Text("Name: Amir Hosen", style: TextStyle(color: Colors.blue, fontSize: 25),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 8,
            child: ListTile(
              title: Text("Contact Mail: amirhosen669222@gmail.com", style: TextStyle(color: Colors.blue),),
              leading: Icon(Icons.mail),
            ),
          ),
          Card(
            elevation: 8,
            child: ListTile(
              title: Text("Phone: +8801787-944065", style: TextStyle(color: Colors.blue),),
              leading: Icon(Icons.phone),
            ),
          ),
          Card(
            elevation: 8,
            child: ListTile(
              title: Text("Facebook: facebook.com/amirhosen.65", style: TextStyle(color: Colors.blue),),
              leading: Icon(Icons.facebook),
            ),
          ),
        ],
      ),
    );
  }
}
