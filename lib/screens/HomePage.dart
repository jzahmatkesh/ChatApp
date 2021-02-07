import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Message', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                  FlatButton(
                    child: Icon(Icons.mode_edit, color: Colors.greenAccent, size: 32,), 
                    onPressed: (){}
                  )
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27.0),
                    gapPadding: 4,
                  ),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14.0),
                  labelText: 'Search',
                  counterText: '',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 28.0,),
                )
              ),
              SizedBox(height: 25),
              Text('Activities', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 25),
              Container(
                height: 115,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    UserWidget(family: 'Selma', pic: 'user1.jpg',),
                    UserWidget(family: 'Emeline', pic: 'user2.jpg',),
                    UserWidget(family: 'Sonia', pic: 'user3.jpg',),
                    UserWidget(family: 'Jean', pic: 'user9.jpg',),
                    UserWidget(family: 'Jack', pic: 'user5.jpg',),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text('Messages', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 25),
              Expanded(
                child: ListView(
                  children: [
                    MessageWidget(family: 'Emeline', msg: 'Hello how are you ? i am going to market. do you want burgers?', pic: 'user2.jpg', time: '23min', count: 1),
                    MessageWidget(family: 'Selma', msg: 'We were on the runways at the military hanger, there is a plane in it.', pic: 'user1.jpg', time: '26min'),
                    MessageWidget(family: 'Jean', msg: 'i received my new watch that i ordered from Amazon.', pic: 'user9.jpg', time: '33min'),
                    MessageWidget(family: 'Sonia', msg: 'i just arrived in front of the school. i\'m waiting for you hurry up !', pic: 'user3.jpg', time: '46min'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline, color: Colors.grey,), activeIcon: Icon(Icons.chat_bubble_outline, color: Colors.green), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.phone, color: Colors.grey,), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.camera, color: Colors.grey,), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.grey,), label: 'Setting'),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key key, @required this.family, @required this.msg, @required this.pic, @required this.time, this.count = 0}) : super(key: key);

  final String family;
  final String msg;
  final String pic;
  final String time;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Container(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(45),
                    image: DecorationImage(image: AssetImage('images/$pic'))
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$family', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('$msg', style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.5),)
              ],
            ),
          ),
          Column(
            children: [
              Text('$time', style: TextStyle(fontSize: 12,  color: count==0 ? Colors.grey.shade800 : Colors.green),),
              SizedBox(height: 10),
              this.count ==  0
                ? Container()
                : CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green.shade600,
                    child: Text('$count', style: TextStyle(color: Colors.white),),
                  )
            ],
          )
        ],
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({Key key, @required this.family, @required this.pic}) : super(key: key);

  final String family;
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Container(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(45),
                  image: DecorationImage(image: AssetImage('images/$pic'))
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text('$family', style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}