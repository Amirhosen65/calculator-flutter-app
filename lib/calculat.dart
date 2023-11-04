import 'package:calculator/about.dart';
import 'package:calculator/contactus.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  String equation='0';
  String result='0';
  String expression='0';

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("AJ Calculator")),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded))
      ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Calculator"), accountEmail: Text("Design by AJ Amir"),
              currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/amir.jpg"),
            ),
            ),
            Card(
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>calculator()));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: (){

                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.info),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>about()));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Contact Us"),
                leading: Icon(Icons.contact_support),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>contactus()));
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xF5F2F2FF),
            alignment: Alignment.centerRight,
            child: Text(equation,style: TextStyle(fontSize: size.height*0.06),maxLines: 1,),
          ),
          Divider(),
          Container(
            color: Color(0xF5F2F2FF),
            alignment: Alignment.centerRight,
            child: Text(result,style: TextStyle(fontSize: size.height*0.06,),maxLines: 1,),
          ),
          Divider(),
          Row(
            children: [
              Container(
                width: size.width*.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildBtn('C', 1.0, Color(0xFFFF1744),Colors.white),
                        buildBtn('AC', 1.0, Color(0xFF0277BD),Colors.white ),
                        buildBtn('÷', 1.0, Color(0xFF0277BD),Colors.white ),
                      ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('7', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('8', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('9', 1.0, Color(0xFF616161),Colors.white ),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('4', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('5', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('6', 1.0, Color(0xFF616161),Colors.white ),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('1', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('2', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('3', 1.0, Color(0xFF616161),Colors.white ),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('.', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('0', 1.0, Color(0xFF616161),Colors.white ),
                          buildBtn('00', 1.0, Color(0xFF616161),Colors.white ),
                        ]
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width*.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildBtn('×', 1.0, Color(0xFF0277BD),Colors.white ),
                      ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('-', 1.0, Color(0xFF0277BD),Colors.white ),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('+', 1.0, Color(0xFF0277BD),Colors.white ),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildBtn('=', 2.0, Color(0xFFEE00FF),Colors.white ),
                        ]
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  Widget buildBtn(String btnText,double btnHeight,Color btnColor,Color shapColor){
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height*.10*btnHeight,
      decoration: BoxDecoration(
        color: btnColor,
      ),
      child: TextButton(
        onPressed: (){
          setState(() {
            if(btnText=='C'){
              equation='0';
              result='0';
            }
            else if(btnText=='AC'){
              equation=equation.substring(0,equation.length-1);
              if(equation==''){
                equation='0';
              }
            }
            else if(btnText=='='){
              expression=equation;
              expression=expression.replaceAll('×', '*');
              expression=expression.replaceAll('÷', '/');
              try{
                Parser p=Parser();
                Expression exp=p.parse(expression);
                ContextModel cm=ContextModel();
                result='${exp.evaluate(EvaluationType.REAL, cm)}';
              }catch(e){
                result='error';
              }
            }
            else{
              if(equation=='0'){
                equation=btnText;
              }
              else
              {
                equation+=btnText;
              }
            }

          });
        },
        child: Text(btnText,style: TextStyle(fontSize: size.height*0.06, color: Colors.white),),
        // shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //         color: shapColor,
        //         width: 1,
        //         style: BorderStyle.solid
        //     )
        // ),

      ),
    );
  }
}
  // Widget buildBtn(String btnText,double btnHeight,Color btnColor,Color shapColor){
  //   Size size=MediaQuery.of(context).size;
  //   return Container(
  //     height: size.height*.13*btnHeight,
  //
  //     decoration: BoxDecoration(
  //       color: btnColor,
  //       borderRadius: BorderRadius.circular(0)
  //     ),
  //     child: FlatButton(
  //       onPressed: (){
  //         setState(() {
  //           if(btnText=='C'){
  //             equation='0';
  //             result='0';
  //           }
  //           else if(btnText=='AC'){
  //             equation=equation.substring(0,equation.length-1);
  //             if(equation==''){
  //               equation='0';
  //             }
  //           }
  //           else if(btnText=='='){
  //             expression=equation;
  //             expression=expression.replaceAll('×', '*');
  //           expression=expression.replaceAll('÷', '/');
  //           try{
  //             Parser p=Parser();
  //             Expression exp=p.parse(expression);
  //             ContextModel cm=ContextModel();
  //             result='${exp.evaluate(EvaluationType.REAL, cm)}';
  //           }
  //           catch(e){
  //             result='error';
  //           }
  //         }
  //         else{
  //           if(equation=='0'){
  //             equation=btnText;
  //             }
  //           else{
  //             equation+=btnText;
  //           }
  //           }
  //             }
  //         );
  //       },
  //       child: Text(btnText,style: TextStyle(fontSize: size.height*0.06),),
  //       shape: RoundedRectangleBorder(
  //         side: BorderSide(
  //           color: shapColor,
  //           width: 1,
  //           style: BorderStyle.solid
  //         )
  //       ),
  //     ),
  //   );
  //   }





