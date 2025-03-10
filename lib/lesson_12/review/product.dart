// // import 'package:flutter/material.dart';
//
// // class ListItem {
//
// //   String headLine="";
// //   String sub1="";
// //   String sub2="";
// //   int iconNumber = 0;
// //   // final icons = List<Icon>.filled(5,Icon(Icons.star));
// //   String imageURL = "";
//
// //   // static const _nameKey = 'name'; static const _phoneKey = 'sub1'; static const _emailKey = 'gender'; static const _passKey = 'pass'; static const _confirmKey = 'confirm';
//
// //   ListItem(this.headLine, this.sub1, this.sub2, this.iconNumber, this.imageURL);
//
// //   // Map<String, dynamic> toJson() {
// //   //   return {"name": name, "phone": phone, "email": email, "pass": pass, "confirm": confirm};
// //   // }
//
// //   static ListItem fromJsonToMap(Map<String, dynamic> json) {
// //     return ListItem(
//
// //       // headLine: json['name'] as String?,
// //       // sub1: json['description'] as String?,
// //       // // sub2: json[_passKey] as String?,
// //       // iconNumber: json['reviewCount'] as int?,
// //       // imageURL: json['image'] as String?
// //     );
// //   }
//
// // }
//
// import 'package:flutter/material.dart';
//
// class ListItem {
//   String headLine = "";
//   String sub1 = "";
//   String sub2 = "";
//   int iconNumber = 0;
//   final icons = List<Icon>.filled(5, Icon(Icons.star));
//   String imageURL = "";
//
//   ListItem(
//       {required this.headLine,
//       required this.sub1,
//       required this.sub2,
//       required this.iconNumber,
//       required this.imageURL});
//
//   static const _nameKey = 'name';
//
//   static ListItem fromJsonToMap(Map<String, dynamic> json) {
//     return ListItem(
//       headLine: json[_nameKey] as String,
//       iconNumber: json[_nameKey] as String,
//       imageURL: ,
//       sub1: ,
//       sub2:
//     );
//   }
// }
//
// List<Widget> productList(items) {
//   final List<Widget> widgets = [];
//   for (int i = 0; i < items.length; i++) {
//     widgets.add(Container(
//         width: 327,
//         height: 120,
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           color: Color(0xffffffff),
//           boxShadow: [
//             BoxShadow(
//                 color: Color(0xff000000).withValues(alpha: 0.05),
//                 blurRadius: 2,
//                 offset: Offset(2, 2),
//                 spreadRadius: 0)
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           spacing: 10,
//           children: [
//             Image.asset(
//               items[i].imageURL,
//               width: 105,
//               height: 94,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     items[i].headLine,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(items[i].sub1, style: TextStyle(fontSize: 13)),
//                   Expanded(child: Container()),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: () {
//                               return List<Icon>.filled(
//                                   items[i].iconNumber,
//                                   Icon(
//                                     Icons.star,
//                                     color: Color(0xffad3f32),
//                                     size: 12,
//                                   ));
//                             }(),
//                           ),
//                           Text(
//                             items[i].sub2,
//                             style: TextStyle(fontSize: 10),
//                           ),
//                         ],
//                       ),
//                       Expanded(child: Container()),
//                       ElevatedButton(
//                           onPressed: () {
//                             // Navigator.pushNamed(context, RouteNamed.loginPage);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xffad3f32),
//                             foregroundColor: Color(0xffffffff),
//                             minimumSize: Size(91, 35),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5))),
//                           ),
//                           child: Text('Reserve'))
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         )));
//   }
//   return widgets;
// }
