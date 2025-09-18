import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_2025/controller/databse.dart';
import 'package:sqflite_2025/controller/model.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
// import 'package:todo_func_sqflite/database.dart';
//import 'package:todo_func_sqflite/database.dart';
// import 'package:todo_func_sqflite/todomodel.dart';
void main(){
  runApp(MyApp());databaseFactory = databaseFactoryFfiWeb;
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: todocls(),
    );
  }
}

 class todocls extends StatefulWidget {
  const todocls({super.key});

  @override
  State createState() => _todocls();
}

class _todocls extends State {

  TextEditingController titleController=TextEditingController();
  TextEditingController discriptionController =TextEditingController();
  TextEditingController dateController =TextEditingController();

  @override
   void initState(){
    super.initState();
    getdata();

  }
   void getdata()async{
      List<Map> cardList = await databaseDemo().getdatabase();
      for(var row in cardList){
        log(row.toString());
      }

      for(var elements in cardList){
       tocardlist.add(todomodel(date: elements['date'], discription: elements['discription'], title:elements['title'],id:elements['id']));
     }
      setState(() {
        
      });
  }
  clearController(){
    titleController.clear();
    discriptionController.clear();
    dateController.clear();
  }
  submit(bool doEdit,[todomodel? obj]){
    if(titleController.text.isNotEmpty && discriptionController.text.isNotEmpty && dateController.text.isNotEmpty){
    if(doEdit){
      obj!.title=titleController.text;
      obj.discription=discriptionController.text;
      obj.date=dateController.text;
      Map<String,dynamic> ins={
            'title':obj.title,
            'discription':obj.discription,
            'date':obj.date,
            'id':obj.id
  
          };
        databaseDemo(). updateDatabase(ins);
    }else{
      tocardlist.add(todomodel(date: dateController.text, discription: discriptionController.text, title: titleController.text));
        Map<String,dynamic> ins={
            'title':titleController.text,
            'discription':discriptionController.text,
            'date':dateController.text,
          };
        databaseDemo(). insertDatabase(ins);
       
    }
    clearController();
    setState(() {
      
    });
    }

  }
  bottomSheet(bool doEdit,[todomodel? obj]){
     return showModalBottomSheet(context: context,
     builder:(context){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text( "Create To_Do Task",
                    style:GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      ),
              ),
              SizedBox(height: 5,),
              Text(
              "title",
              style:GoogleFonts.quicksand(
              fontSize: 18,
              color:Color.fromRGBO(2,167,177,1),
              ),),
              SizedBox(height:5),
              TextField(
                controller: titleController,
                decoration: InputDecoration(border: OutlineInputBorder(borderSide:BorderSide(
                      color:Color.fromRGBO(2, 167, 177, 1)),borderRadius: BorderRadius.circular(20),),hintText: "Enter the title ",),

              ),
              Text(
              "discription",
              style:GoogleFonts.quicksand(
              fontSize: 18,
              color:Color.fromRGBO(2,167,177,1),
              ),),
               SizedBox(height:5),
              TextField(
                controller: discriptionController,
                decoration: InputDecoration(border: OutlineInputBorder(borderSide:BorderSide(
                      color:Color.fromRGBO(2, 167, 177, 1)),borderRadius: BorderRadius.circular(20),),hintText: "Enter the discription ",),

              ),
              Text(
              "date",
              style:GoogleFonts.quicksand(
              fontSize: 18,
              color:Color.fromRGBO(2,167,177,1),
              
              ),),
               SizedBox(height:5),
              TextField(
                  onTap: ()async{
                   DateTime? date=await showDatePicker(context: context, firstDate: DateTime(2025), lastDate: DateTime(2026));
                   String dateStr=DateFormat.yMMMd().format( date!);
                   dateController.text=dateStr;

                  },
                  controller: dateController,
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide:BorderSide(
                        color:Color.fromRGBO(2, 167, 177, 1)),borderRadius: BorderRadius.circular(20),),hintText: "Enter the date",suffixIcon: Icon(Icons.date_range_outlined)),
                
                ),
             
              SizedBox(height:8),
              ElevatedButton(onPressed: (){
                
                  if(doEdit){
                    submit(true,obj);

                  }else{
                    submit(false);
                  }
                  Navigator.of(context).pop();
                

              }, 
               style:ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(2, 167, 177, 1),
                        ),
                      ),
              child: Text("Submit",)),
              SizedBox(height:20),
              
              

        ],
      );


     },);
  }
  List cardsColor=[
    Color.fromRGBO(250,232,232,1),
    Color.fromRGBO(232,237,250,1),
    Color.fromRGBO(250,249,232,1),
    Color.fromRGBO(250,232,250,1),
  ];
  List<todomodel> tocardlist=[
    todomodel(date: "25 sep,2025", discription: "no more tlkk innnn kuhiurehoroqjkidjiouo kjhdiuhiuh dwahiuyiuhiuah hdiuhdiuahiudh", title: "bharti")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(2,167,177,1.0),
          title:Text("Todo app",style:GoogleFonts.quicksand(fontWeight: FontWeight.w700,fontSize: 30,color: Color.fromRGBO(255, 255, 255, 1)
          ),
          ),
          ),
        body:ListView.builder(
          itemCount:tocardlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:BoxDecoration(
                  color:cardsColor[index % cardsColor.length],
                  borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:10.0,left:5),
                            child: Container(
                              height:70,
                              width:70,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network("https://static.vecteezy.com/system/resources/previews/003/529/153/non_2x/business-to-do-list-flat-icon-modern-style-vector.jpg",fit: BoxFit.cover,)),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                 tocardlist[index].title,
                                   style:GoogleFonts.quicksand(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                                Text(
                                 tocardlist[index].discription,
                                   style:GoogleFonts.quicksand(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:3),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right:10,bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              tocardlist[index].date,
                              style: GoogleFonts.quicksand(fontSize: 18,
                              fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                titleController.text=tocardlist[index].title;
                                discriptionController.text=tocardlist[index].discription;
                                dateController.text=tocardlist[index].date;
      
      
                                bottomSheet(true,tocardlist[index]);
                              },
                              child: Icon(Icons.edit,color: Color.fromRGBO(2, 68, 2, 1),)),
                            SizedBox(width:5),
                            GestureDetector(
                              onTap: (){
                                int id=tocardlist[index].id;
                                tocardlist.removeAt(index);
                                databaseDemo().deleteDatabase(id);
                                setState(() {
                                  
                                });
                              },
                              child: Icon(Icons.delete,color: Color.fromRGBO(2, 68, 2, 1),))
                          ],
                        ),
                      ),
                    ],
                  ),
              
              
                
              ),
            );
      
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            bottomSheet(false);
      
        },
        child: Icon(Icons.add,color:Color.fromRGBO(255, 254, 254, 1),),
        backgroundColor: Color.fromRGBO(2,167,177,1.0),),
      
      );
  }
}