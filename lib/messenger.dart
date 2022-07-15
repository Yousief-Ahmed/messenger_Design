import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class messenger extends StatefulWidget {
  @override
  State<messenger> createState() => _messengerState();
}

class _messengerState extends State<messenger> {
  @override
  int currentindex=0;

  var emailcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        toolbarHeight: 40,
        leadingWidth: 40,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 15,
          ),
          child: Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 15.0,
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/109359820?s=96&v=4")
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
         title:Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chats",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              end: 8,
            ),
            child: IconButton(onPressed: (){
            },
                icon:Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 17.0,
                )
            ),
          ),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
        onTap: (index)=> setState(()=>currentindex=index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.video_call_sharp),
            label: 'Calls',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 7,
                  ),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      //autofocus: true,
                      controller: emailcontroller,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13.7 ,
                        ),
                          hintText: "Search",
                          border:InputBorder.none,
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 25,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            size: 18,
                            color: Colors.grey,
                          )
                      ),
                    ),
                  ),
                ), //search Bar
              // SizedBox(
              //   height: 15.0,
              // ),
              Container(
                height: 105,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) =>buildStory() ,
                    separatorBuilder: (context,index) => SizedBox(
                      width: 10,
                    ),
                    itemCount:10
                ),
              ), //story
              SizedBox(
                height: 5,
              ), // space between stories and chats
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index) =>buildChat() ,
                  separatorBuilder: (context,index) => SizedBox(
                    height: 10,
                  ),
                  itemCount:15
              ), // chat

            ],
          ),
        ),

      ),

    );
  }
}
  Widget buildStory() => Container(
    width: 65.0,
    child: Column(
      children: [
        Stack(
          alignment:AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/109359820?s=96&v=4"),
            ),
            CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top :5.0,
            bottom: 5.0,
            start: 8.0,
          ),
          child: Text(
            "Yousief Ahmed",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
  Widget buildChat() => Row(
    children: [
      Stack(
        alignment:AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/109359820?s=96&v=4")
          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 8.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yousief Ahmed ",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Hello, My name is Yousief",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "02.00 pm",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),

    ],
  );


