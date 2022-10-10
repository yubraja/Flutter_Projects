import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  final img_url="https://www.facebook.com/photo/?fbid=921487321673896&set=pb.100063713979740.-2207520000..";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child:Container(
        color:Colors.deepPurple, 
        child: ListView(

          padding: EdgeInsets.zero,
          
          

          children: [
          
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration:BoxDecoration(
                color: Colors.deepPurple
              ),
              accountEmail: const Text("yubi@gmail.com"),
              accountName: const Text("yubsss"),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(img_url),)
              
             

            )
            ),
             ListTile(
              leading:Icon(CupertinoIcons.home,
              color:Colors.white,
              ),
              title:Text("Home",textScaleFactor: 1.2, 
              style:TextStyle(color:Colors.white,))
              ,
             
              ),
               ListTile(
              leading:Icon(CupertinoIcons.profile_circled,
              color:Colors.white,
              ),
              title:Text("Profile",textScaleFactor: 1.2, 
              style:TextStyle(color:Colors.white,))
              ,
             
              ),
               ListTile(
              leading:Icon(CupertinoIcons.mail,
              color:Colors.white,
              ),
              title:Text("Email me",textScaleFactor: 1.2, 
              style:TextStyle(color:Colors.white,))
              ,
             
              )
          
          ],
        ),
      )
    );
    
  }
}