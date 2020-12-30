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

//ボタンクラスを作って引数にテキスト・フォントサイズ・ボタンのタイプ・fontColor・関数を渡したい
class _btnClass extends StatelessWidget {
  String _text;
  double _fontSize;
  int _btnType;  //1.RaisedBtn 2.FlatBtn 3.FlautingActBtn
  Color _fontCol;
  Function _func;

  //コンストラクタ
  _btnClass(String text, double fontSize, int btnType, Color fontCol, Function func) {
    this._text = text;
    this._fontSize = fontSize;
    this._btnType = btnType;
    this._fontCol = fontCol;
    this._func = func;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox( //ボタンを領域一杯に広げる
      width: double.infinity,
      height: double.infinity, //infinity=最大,// 的な
      //double.infinityでちゃんと親要素で領域確保しないと、スマホ画面全体に広がっちゃったりする
      child: btnType(_btnType, _fontSize, _fontCol, _func),//childにはWidgetを返さないといけない。
    );
  }

  //childに値を返すようウィジェット
  Widget btnType(int state, double _fontSize, Color _fontCol, Function _f){
    switch(state){
      case 1:
        return RaisedButton(
          onPressed: () {
            //TODO処理書く
            _f();
          },
          child: Text(
            _text,
            style: TextStyle(
              fontSize: _fontSize,//fontSizeはddouble型だった。
              color: _fontCol,
            ),
          ),
        );
        break;
      case 2:
        return FlatButton(
          onPressed: () {
            //TODO処理書く
            _f();
          },
          child: Text(
            _text,
            style: TextStyle(
              fontSize: _fontSize,//fontSizeはddouble型だった。
              color: _fontCol,
            ),
          ),
        );
        break;
      case 3:
        return FloatingActionButton(
          onPressed: () {
            //TODO処理書く
            _f();
          },
          child: Text(
            _text,
            style: TextStyle(
              fontSize: _fontSize,//fontSizeはddouble型だった。
              color: _fontCol,
            ),
          ),
        );
        break;
      default:
        break;
    }
  }
}

enum CALC_TYPE {add, sub, multi, div} //左から＋、－、＊、/

class _MyHomePageState extends State<MyHomePage> {
  double _firstNum = 0;   //[+]とか押した時、値を保持する
  double _setNum = 0;     //内部の処理用
  double _displayNum = 0; //表示用
  CALC_TYPE _calcType;    //＋－＊/ or null いずれかの状態を保持
  int _displayPow = 0;    //べき乗の表示
  bool _decimalFlg = false;

  //ディスプレイに計算結果を表示
  void _setNumFunc(double num){
    _displayPow = 0;
    if(_displayNum == _setNum){
      if(10000000000 > _displayNum){
        setState(() {
          if(!_decimalFlg) _displayNum = _displayNum * 10 + num;
          else{
            int count = 1;
            for(int i = 0;
            _displayNum * Math.pow(10, i) != (_displayNum * Math.pow(10, i)).ceil();
            i++){
              count++;
            }
            _displayNum = double.parse((_displayNum + (num / Math.pow(10, count))).toStringAsFixed(count));
            _checkDecimal();
          }
          _setNum = _displayNum;
        });
      }
    }else{
      setState(() {
        _displayNum = num;
        _setNum = _displayNum;
        _calcType = null;
      });
    }
  }

  //＋－＊/ボタンを押したとき
  void _calcBtnPressed(CALC_TYPE type){
    _setNum = _displayNum;
    _firstNum = _setNum;
    _setNum = 0;
    _displayNum = 0;
    _calcType = type;
  }

  //足し算
  void _calcAdd(){
    setState(() {
      _displayNum = _firstNum + _setNum;
      _checkDecimal();
      _firstNum = _displayNum;
    });
  }

  //引き算
  void _calcSub(){
    setState(() {
      _displayNum = _firstNum - _setNum;
      _checkDecimal();
      _firstNum = _displayNum;
    });
  }

  //掛け算
  void _calcMulti(){
    setState(() {
      _displayNum = _firstNum * _setNum;
      _checkDecimal();
      _firstNum = _displayNum;
    });
  }

  //割り算
  void _calcDiv(){
    setState(() {
      _displayNum = _firstNum / _setNum;
      _checkDecimal();
      _firstNum = _displayNum;
    });
  }

  //+,-入れ替え
  void _invertedNum(){
    setState(() {
      _displayNum = -_displayNum;
      _setNum = -_setNum;
    });
  }

  void _checkDecimal(){
    double checkNum = _displayNum;
    if(100000000000 < _displayNum || //12桁よりも多いか
        _displayNum == _displayNum.toInt()){//小数点以下を含まないか
      for(int i= 0; 100000000000 < _displayNum / Math.pow(10, i); i++){
        _displayPow = i;
        checkNum = checkNum / 10;
      }
      _displayNum = checkNum.floor().toDouble();
    }else{
      int count = 0;
      for (int i = 0; 1 < _displayNum /Math.pow(10, i); i++){
        count = i;
      }
      int displayCount = 10 - count;
      _displayNum = double.parse(_displayNum.toStringAsFixed(displayCount));
    }
  }


  void _clearNum(){
    setState(() {
      _clearEntryNum(); //被っている内容
      _firstNum = 0;
      _calcType = null;
    });
  }

  void _clearEntryNum(){
    setState(() {
      _setNum = 0;
      _displayNum = 0;
      _displayPow = 0;
      _decimalFlg = false;
    });
  }

  void _dFlagTrue(){
    _decimalFlg = true;
  }

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
              child:  _displayPow > 0 ? Text(
                "10^${_displayPow.toString()}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ) : Container(),
            ),
            Text(//数字、計算結果表示
              _displayNum == _displayNum.toInt()
                  ? _displayNum.toInt().toString()
                  : _displayNum.toString(),
              style: TextStyle(
                fontSize: 50,
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

                          Expanded(
                            //_btnClass 自作クラス,引数 Text,fontSize,btntype(1.Raised 2.Flat 3.Float),fontColor,function
                            child: _btnClass('CE', 40, 1, Colors.red, _clearEntryNum),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: _btnClass('C', 40, 1, Colors.green, _clearNum),
                          ),
                          Expanded(//横にも目いっぱい広がる
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: RaisedButton(
                                onPressed: (){
                                  switch(_calcType){
                                    case CALC_TYPE.add:
                                      _calcAdd();
                                      break;
                                    case CALC_TYPE.sub:
                                      _calcSub();
                                      break;
                                    case CALC_TYPE.multi:
                                      _calcMulti();
                                      break;
                                    case CALC_TYPE.div:
                                      _calcDiv();
                                      break;
                                    default:
                                      break;
                                  }
                                },
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //2列目
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: _btnClass('1', 45, 3, Colors.white, () => _setNumFunc(1)),//引数ありの関数のわたしかた()=>関数名(引数)
                          ),
                          Expanded(
                            child: _btnClass('2', 45, 3, Colors.white, () => _setNumFunc(2)),
                          ),
                          Expanded(
                            child: _btnClass('3', 45, 3, Colors.white, () => _setNumFunc(3)),
                          ),
                          Expanded(
                            child: _btnClass('÷', 45, 1, Colors.black, () => _calcBtnPressed(CALC_TYPE.div)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: _btnClass('4', 45, 3, Colors.white, () => _setNumFunc(4)),
                          ),
                          Expanded(
                            child: _btnClass('5', 45, 3, Colors.white, () => _setNumFunc(5)),
                          ),
                          Expanded(
                            child: _btnClass('6', 45, 3, Colors.white, () => _setNumFunc(6)),
                          ),
                          Expanded(
                            child: _btnClass('×', 45, 1, Colors.black, () => _calcBtnPressed(CALC_TYPE.multi)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: _btnClass('7', 45, 3, Colors.white, () => _setNumFunc(7)),
                          ),
                          Expanded(
                            child: _btnClass('8', 45, 3, Colors.white, () => _setNumFunc(8)),
                          ),
                          Expanded(
                            child: _btnClass('9', 45, 3, Colors.white, () => _setNumFunc(9)),
                          ),
                          Expanded(
                            child: _btnClass('－', 35, 1, Colors.black, () => _calcBtnPressed(CALC_TYPE.sub)),
                          ),
                        ],
                      ),
                    ),

                    //5列目
                    Expanded(//縦に目いっぱい広がる
                      child: Row(
                        children: <Widget>[
                          Expanded(//横にも目いっぱい広がる
                            child: _btnClass('+/-', 35, 1, Colors.black, _invertedNum),
                          ),
                          Expanded(
                            child: _btnClass('0', 45, 3, Colors.white, () => _setNumFunc(0)),
                          ),
                          Expanded(
                            child: _btnClass('.', 45, 1, Colors.black, _dFlagTrue),
                          ),
                          Expanded(
                            child: _btnClass('+', 45, 1, Colors.black, () => _calcBtnPressed(CALC_TYPE.add)),
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
