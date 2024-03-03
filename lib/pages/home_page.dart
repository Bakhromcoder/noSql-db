

 import 'package:flutter/material.dart';
import 'package:ng_demo10/model/member_model.dart';
import 'package:ng_demo10/services/hive_service.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

   @override
   State<HomePage> createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {

  String name = 'No name';

  loadMember() async {
    var member = HiveService.loadMember();
    setState(() {
      name = member.id.toString();
    });
  }

   loadMembers() async {
    List members = HiveService.getAllMembers();
    setState(() {
      name = members.first.id.toString();
    });
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Member member = Member(2000, 'Bahrom');
    // HiveService.removeMember(member);
    Member member1 = Member(2000, 'Jonibek');
    Member member2 = Member(2002, 'Oybek');

    HiveService.saveMember(member1);
    HiveService.saveMember(member2);

   loadMembers();


  }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.blue,
         centerTitle: true,
         title: Text('NoSQL'),
       ),
       body: Center(
         child: Text(
           name,
         ),
       ),
     );
   }
 }
