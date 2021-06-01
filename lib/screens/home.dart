import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'edit.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[

          Container(
            color: const Color(0xFFfa7373),
            padding: const EdgeInsets.only(top:20,left: 20, bottom: 20),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top:20,bottom: 20),
                  child:
                  Text(
                    '12월 8일 화요일',
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white
                        ),
                  ),
                ),
                Text(
                  '임신확률이 낮아요',
                  style:TextStyle(
                    fontSize: 22,
                      color: Colors.white

                  ),
                ),
                Text(
                  '생리 5일째 입니다.',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                      color: Colors.white

                  ),
                ),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left:10,top: 10,right: 10,bottom: 10),
                      color: Colors.red,
                      child:
                      Text(
                        '피임시도',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ],

                ),
              ],
            ),

          ),
        ],

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        tooltip: '노트를 추가하려면 클릭하세요.',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ),
    );
  }

}

