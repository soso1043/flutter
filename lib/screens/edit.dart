/*import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:test_diana/screens/test.dart';

void main() => runApp(MaterialApp(
  home: EditPage(),
));

class EditPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EditPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  BorderRadiusTween borderRadius;
  Duration _duration = Duration(milliseconds: 500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  double _height, min = 0.1, initial = 0.3, max = 1;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(10.0),
      end: BorderRadius.circular(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('DraggableScrollableSheet'),
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
          elevation: 5,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          onPressed: () async {
            if (_controller.isDismissed)
              _controller.forward();
            else if (_controller.isCompleted) _controller.reverse();
          },
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            FlutterLogo(size: 500),
            SizedBox.expand(
              child: SlideTransition(
                position: _tween.animate(_controller),
                child: DraggableScrollableSheet(
                  minChildSize: min, // 0.1 times of available height, sheet can't go below this on dragging
                  maxChildSize: max, // 0.7 times of available height, sheet can't go above this on dragging
                  initialChildSize: initial, // 0.1 times of available height, sheet start at this size when opened for first time
                  builder: (BuildContext context, ScrollController controller) {
                    if (controller.hasClients) {
                      var dimension = controller.position.viewportDimension;
                      _height ??= dimension / initial;
                      /*
                      if (dimension >= _height * max * 0.9)
                        _onWidgetDidBuild(() {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('ON TOP'),
                            duration: Duration(seconds: 3),
                          ));
                        });
                      else if (dimension <= _height * min * 1.1)
                        _onWidgetDidBuild(() {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('ON BOTTOM'),
                            duration: Duration(seconds: 3),
                          ));
                        });*/
                    }
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(10,10),
                            blurRadius: 15.0,
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return ClipRRect(
                            borderRadius: borderRadius.evaluate(CurvedAnimation(parent: _controller, curve: Curves.ease)),
                              child: Container(
                                color: Colors.white,
                                child: CustomScrollView(
                                  controller: controller,
                                  slivers: <Widget>[
                                    SliverAppBar(
                                      title: Text("-"),
                                      backgroundColor: const Color(0xFFfa7373),
                                      automaticallyImplyLeading: false,
                                      primary: false,
                                      floating: true,
                                      pinned: true,
                                    ),
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index){
                                              return ChooseTextButtonWidget(Colors.white);
                                            },
                                        childCount: 1
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(Color color) => Container(
    height: 100.0,
    color: color,
    child: Center(
      child: Text(
        "title",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            ),
      ),
    ),
  );


  _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

}