import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class second extends StatefulWidget {
  const second({ Key? key }) : super(key: key);

  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  var gettext = "";
  var edit = "";
 var lst = [];
TextEditingController txt=TextEditingController();
 submitt(){
setState(() {
  lst.add(gettext);
});
 }
  @override
  Widget build(BuildContext context) {
    return 
      
    Scaffold( 
      appBar: AppBar(title: Text("TODO APP"),),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              controller: txt,
              onChanged: (value) {
                gettext = value;
              }
              

            ),
            TextButton(onPressed:() {

              submitt();
              txt.clear();
            }, 
            style: TextButton.styleFrom(
        primary: Colors.pink,
      ),
            
            child: Text("Add",
             style: TextStyle(fontSize: 20),)),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:lst.length,
              itemBuilder: (context,index){
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  child: ListTile(tileColor: Colors.blue[50],
                    leading: 
                    CircleAvatar(radius: 25,backgroundColor:Colors.red,),
                    title:Text(lst[index]) ,),
                    actions: <Widget> [
 IconSlideAction(
      caption: 'delete',
      color: Colors.blue,
      icon: Icons.archive,
      onTap: () {
setState(() {
  lst.remove(lst[index]);
});
      },
    ), IconSlideAction(
      caption: 'Edit',
      color: Colors.green,
      icon: Icons.edit,
      onTap: () {
setState(() {
  showDialog(context: context, builder:(BuildContext context){
return AlertDialog(
  title: Text("Edit Task number ${index}"),
  actions: [
    TextFormField(
      initialValue: lst[index],
      onChanged: (value){
edit = value;
      },
  
    ),
  
  TextButton(onPressed: (){
    setState(() {
      lst[index] = edit;
      Navigator.of(context).pop();
    });
  }, child: Text("update"))
  ],
  
);

  });
});
      },
    ),


                    ],
                );
              }, )


          ],),
      ),
       
      
    );
  }
}