import 'package:flutter/material.dart';
import '../route/route.dart';


class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  String nameFromLogin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Center(child: Text('Welcome $nameFromLogin')),
            ElevatedButton(
                onPressed: () async {
                  bool? result = true;
                  if (nameFromLogin.isEmpty) {
                    await showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (context) {
                        return Container(
                            // height: 400,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                  'Ban chua nhap ten, ban co muon tiep tuc'),
                            ));
                      },
                    );
                    // result = await showDialog<bool>(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) {
                    //     return SimpleDialog(
                    //       // initialTime: TimeOfDay(hour: 15, minute: 20),
                    //       // firstDate: DateTime.now(),
                    //       // lastDate: DateTime.now().add(Duration(days: 15)),
                    //
                    //       title: Text('Ban chua nhap ten'),
                    //       children: [
                    //         TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(context, false);
                    //             },
                    //             child: Text('Cancel')),
                    //         TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(context, true);
                    //             },
                    //             child: Text('OK')),
                    //       ],
                    //       // content:
                    //       //     Text('Ban chua nhap ten, ban co muon tiep tuc'),
                    //       // actions: [
                    //       //   TextButton(
                    //       //       onPressed: () {
                    //       //         Navigator.pop(context, false);
                    //       //       },
                    //       //       child: Text('Cancel')),
                    //       //   TextButton(
                    //       //       onPressed: () {
                    //       //         Navigator.pop(context, true);
                    //       //       },
                    //       //       child: Text('OK')),
                    //       // ],
                    //     );
                    //   },
                    // );
                  }

                  if (result ?? false) {
                    Navigator.pushNamed(context, RouteNamed.homePage,
                        arguments: <String, dynamic>{
                          'nameKey': nameFromLogin,
                        });
                  }
                },
                child: Text('Go Home')),
            ElevatedButton(
                onPressed: () async {
                  final result =
                      await Navigator.pushNamed(context, RouteNamed.loginPage);
                  if (result is String && result.isNotEmpty) {
                    nameFromLogin = result;
                    setState(() {});
                  }
                },
                child: Text('Go Login'))
          ],
        ),
      ),
    );
  }
}