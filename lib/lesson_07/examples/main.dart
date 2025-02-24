import 'dart:convert';

import 'package:dart_learner/lesson_07/examples/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? prefsLocal;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppPreference.prefsLocal = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  bool isLoading = false;
  static const userKey = 'USER_KEY';

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  bool isMale = false;

  @override
  void initState() {
    final String? userString = AppPreference.prefsLocal?.getString(userKey);
    if(userString == null) return;

    print('USERUSER - ${userString.runtimeType}: $userString ');
    final json = jsonDecode(userString??'');
    print('USERUSER 2 - ${json.runtimeType}: $json ');
    User user = User.fromJson(json);
    print('USERUSER 3 - ${user.runtimeType}: $json ');

    nameController.text = user.name ?? '';
    ageController.text = user.age.toString();
    isMale = user.gender ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Input Name'),
                  ),

                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Age'),
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: isMale,
                        onChanged: (value) {
                          setState(() {
                            isMale = value ?? false;
                          });
                        },
                      ),
                      Text('isMale')
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(Duration(seconds: 2));

                        final ageNum = int.parse(ageController.text);
                        final user = User(
                            name: nameController.text,
                            age: ageNum,
                            gender: isMale);
                        print('VJAHJGDH user: ${user.runtimeType}');

                        final userJson = user.toJson();
                        print('VJAHJGDH ${userJson.runtimeType}: $userJson');
                        final raw = jsonEncode(userJson);
                        print('VJAHJGDH ${raw.runtimeType}: $raw');
                        await AppPreference.prefsLocal?.setString(userKey, raw);

                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: Text('Save to Local')),

                  // ElevatedButton(
                  //     onPressed: () async{
                  //
                  //       // final String? nameFromPre = prefsLocal.getString(nameKey);
                  //       // nameController.text = nameFromPre??'';
                  //       // final int? ageFromPre = prefsLocal.getInt(ageKey);
                  //       // ageController.text = ageFromPre.toString();
                  //       // final bool? gender = prefsLocal.getBool(genderKey);
                  //       // isMale = gender??false;
                  //
                  //       setState(() {
                  //
                  //       });
                  //
                  //
                  //     }, child: Text('Load From Local')),
                ],
              ),
              if (isLoading) CircularProgressIndicator()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Icon(Icons.add),
        ));
  }
}

//Tao 1 form gom, Ho va Ten (String), Tuoi (int), Gioi tinh (bool).
// Co 1 button 'Save To Local', Sau khi nhan thi luu xuong local
// Co 1 button 'Load From Local', Sau khi nhan thi lay du lieu tu local len va hien thi
// Hien thi Text:  Ho va ten - tuoi - gioi tinh,
// hoac gan lai du lieu cho cac truong nhap o tren
