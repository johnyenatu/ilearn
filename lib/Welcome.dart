import 'package:flutter/material.dart';
import 'package:ilearn/pages/student/StudentHome.dart';
import 'package:ilearn/utils/RouteLink.dart';

//void main() => runApp(Welcome());

class RunMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: Welcome()),
    );
  }
}


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          SizedBox(
            height: 40,
          ),
         buildHomeMenu(context)
        ],
      ),
    );
  }
  Widget buildHomeMenu(BuildContext con){
    Items item2 = new Items(
      title: "Parent",
      subtitle: "Bocali, Apple",
      event: "4 Items",
      img: "assets/images/food.png",
    );
    Items item3 = new Items(
      title: "Student",
      subtitle: "Lucy Mao going to Office",
      event: "",
      img: "assets/images/map.png",
    );
    Items item4 = new Items(
      title: "Teacher",
      subtitle: "Rose favirited your Post",
      event: "",
      img: "assets/images/festival.png",
    );
    Items item5 = new Items(
      title: "To do",
      subtitle: "Homework, Design",
      event: "4 Items",
      img: "assets/images/todo.png",
    );

    List<Items> myList = [ item2, item3, item4, item5];
    var color = 0xff453658;
    return Flexible(
      child: Center(
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(left: 16, right: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: myList.map((data) {
              return GestureDetector(
                onTap: (){
                  print('printing somehting');
                  Navigator.push(
                    con,
                    MaterialPageRoute(builder: (context) => StudentHome()),
                  );
                  },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(color), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 42,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.subtitle,
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.event,
                        style:TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }


}
class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}