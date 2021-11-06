import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({ Key? key }) : super(key: key);

  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  var gettext = "";
  var lst = [];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(body: 
    Column(
      children: [
        TextField(
          onChanged: (value){
            gettext = value;

          },
        ),
        TextButton(onPressed:(){

        }, child: Text("add")),

        ListView.builder(
          itemBuilder:
           (context,index){
             return ListTile(
               leading: CircleAvatar(backgroundColor:Colors.red,radius: 25,),
               title: Text(lst[index]),);})
      ],
      
    ),
     
    );
  }
}