import 'package:flutter/material.dart';


class ListItem {
  String headLine="";
  String sub1="";
  String sub2="";
  int iconNumber = 0;
  final icons = List<Icon>.filled(5,Icon(Icons.star));
  String cta = "";

  ListItem(this.headLine, this.sub1, this.sub2, this.iconNumber, this.cta);
}

class BestsellerPage extends StatefulWidget {
  const BestsellerPage({super.key});
  @override
  State<BestsellerPage> createState() => _BestsellerPage();
}

class _BestsellerPage extends State<BestsellerPage> {
  List<ListItem> items=[ListItem("Beef 0","USDA 1","(100)", 1,"Reserve"),
    ListItem("Beef 1","USDA 1","(100)", 2,"Reserve"),
    ListItem("Beef 2","USDA 2","(100)", 3,"Reserve"),
    ListItem("Beef 3","USDA 3","(100)", 4,"Reserve"),
    ListItem("Beef 4","USDA 4","(100)", 5,"Reserve"),
  ];  

  @override
  Widget build(BuildContext context) {
    String name = '';
    return Scaffold(
      body: SingleChildScrollView(
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: buildListItems(),
          // children: [
          //   Center(child: Text('LoginPage')),
          //   TextFormField(
          //     onChanged: (value) {
          //       name = value;
          //     },
          //     decoration: InputDecoration(
          //         border: OutlineInputBorder(), hintText: 'Input your Name'),
          //   ),
          //   ElevatedButton(
          //       onPressed: () {
          //         if (Navigator.canPop(context)) {
          //           Navigator.pop(context, name);
          //         }
          //       },
          //       child: Text('Back'))
          // ],
        ),
      ),
    );
  }

  List<Widget> buildListItems() {
    final List<Widget> widgets = [];
    for (int i = 0; i < items.length; i++) {
      widgets.add(
          Container(
            color: Color(0xffffffff),
            width: 100,
            height: 100,
            child: Column(
              children: [
                Text(items[i].headLine),
                Text(items[i].sub1),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(children: (){return List<Icon>.filled(items[i].iconNumber,Icon(Icons.star)); }(), ),
                        Text(items[i].sub2)],
                    ),
                    Expanded(child: Container()),
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, RouteNamed.loginPage);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffad3f32)),
                        child: Text('Reserve')
                    )

                  ],
                )
              ],
            ),
          )

      );
    }
    return widgets;
  }
}