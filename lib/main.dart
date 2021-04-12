import 'package:flutter/material.dart';
import 'package:easybee/db/database.dart';

void main() {
  runApp(KeepoApp());
}

class KeepoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keepo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(title: 'Keepo'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;


  @override
  void initState() {
    super.initState();
    // _loadDatabase();
  }

  // Future<void> _loadDatabase() async {
  //   var db = await openDatabase('easyBee.db');
  // }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.build_outlined),
                    labelText: 'Task Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red, 
                        width: 5.0
                      ),
                    )
                  ),
                  validator: (String value) {
                    return (value != null) ? 'This field is required' : null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money),
                    labelText: 'Money',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red, 
                        width: 5.0
                      ),
                    )
                  ),
                  validator: (String value) {
                    return (value != null) ? 'This field is required' : null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'To',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red, 
                        width: 5.0
                      ),
                    )
                  ),
                  validator: (String value) {
                    return (value != null) ? 'This field is required' : null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange[600],
                    primary: Colors.white,
                    padding: EdgeInsets.all(20),
                  ),
                  child: Text("Add"),
                  onPressed: (){
                    print("Hello");
                  },
                )
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget form() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Title
            // Paid / Owed
            // Type: (Invoice / Goals) / Expense / Goal
            // Personal (swipe right) // Business
            // 1
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final int id;
  final String note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int type;

  Transaction({this.id, this.note, this.createdAt, this.updatedAt, this.type});
}
