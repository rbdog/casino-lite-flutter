import 'package:flutter/material.dart';
import 'dart:math' as Math; //べき乗のため追加
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //demobanner非表示
      title: 'ヘムわんの電卓',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'ヘムわんの電卓'),
    );
  }
}

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,//Textを左寄りに
          children: <Widget>[
            Container(
              height: 20,//べき乗表示のための領域、際社から表示するため
              child:  Text('ここにべき乗'),
            ),
            Text(
              'test',
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    //1列目
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: Container(),//空白のための領域
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  'CE',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '×',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '÷',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '+/-',
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(//ボタンを領域一杯に広げる
                              width: double.infinity,
                              height: double.infinity,//infinity=最大,// 的な
                              //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
                              child: FloatingActionButton(
                                onPressed: (){
                                  //TODO処理書く
                                },
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
