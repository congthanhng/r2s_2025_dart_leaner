import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_4/page/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_application_4/user.dart';
// #docregion migrate






//---------------------------------------------------------------------------
class AppPreference {
  static SharedPreferences? prefsLocal;
}


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  int count = 0;
  bool isLoading = false;
  static const userKey = 'USER_KEY';



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // A key for managing the form
  String _name = ''; // Variable to store the entered name
  String _email = ''; // Variable to store the entered email
  
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  // alphanumeric
  static final  validCharName = RegExp(r'^[a-zA-Z]+$');
  static final  validCharPhone = RegExp(r'^[0-9]+$');
  static final  validCharEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool checkNumber (value){
    value.split('').forEach((ch) 
    {
      if(RegExp(r'^[0-9]+$').hasMatch(ch)) {return true;}
    });
    return false;
  }
  bool checkUpperCase (value){
    value.split('').forEach((ch) 
    {
      if(RegExp(r'^[A-Z]+$').hasMatch(ch)) {return true;}
    });
    return false;
  }
  bool checkLowerCase (value){
    value.split('').forEach((ch) 
    {
      if(RegExp(r'^[a-z]+$').hasMatch(ch)) {return true;}
    });
    return false;
  }
  bool checkSpecialCase (value){
    value.split('').forEach((ch) 
    {
      if(!RegExp(r'^[a-zA-Z]+$').hasMatch(ch)) {return true;}
    });
    return false;
  }

  // void _saveData(){
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Save an integer value to 'counter' key.
  //   await prefs.setInt('counter', 10);
  // }


  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      // You can perform actions with the form data here and extract the details
      print('Name: $_name'); // Print the name
      print('Email: $_email'); // Print the email
    }
  }
  //read data
  @override
  void initState() {
    //đọc data
    final String? userString = AppPreference.prefsLocal?.getString(userKey);
    if(userString==null) return;

    print('USERUSER - ${userString.runtimeType}: $userString ');
    //convert data to json
    final json = jsonDecode(userString??'');
    print('USERUSER 2 - ${json.runtimeType}: $json ');
    //convert json to map
    User user = User.fromJsonToMap(json);
    print('USERUSER 3 - ${user.runtimeType}: $json ');
    //gắn data vô controller
    nameController.text = user.name ?? '';
    phoneController.text = user.phone.toString();
    emailController.text = user.email ?? '';
    passController.text = user.pass ?? '';
    confirmController.text = user.confirm ?? '';

    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form Example'),
      ),
      body: Form(
        key: _formKey, // Associate the form key with this Form widget
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Name
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()), // Label for the name field
                  // validator: (value) {
                  //   if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
                  //   if (!validCharName.hasMatch(value)) {return 'full name không được chứa kí tự đặc biệt và kí tự số';}
                  //   return null; // Return null if the name is valid
                  // },
                  onSaved: (value) {_name = value!; }, // Save the entered name
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone number', border: OutlineInputBorder()), // Label for the name field
                  // validator: (value) {
                  //   if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
                  //   if (value.length <10) {return 'phone number phải theo chuẩn phone number việt nam. 10 số';} // Return an error message if the name is empty
                  //   return null; // Return null if the name is valid
                  // },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  maxLength: 10,
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()), // Label for the email field
                  validator: (value) {
                    if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
                    if (!validCharEmail.hasMatch(value)) {return 'Email theo chuẩn email';} // Return an error message if the name is empty
                    return null; // Return null if the email is valid
                  },
                  onSaved: (value) {
                    _email = value!; // Save the entered email
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passController,
                  decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()), // Label for the email field
                  validator: (value) {
                    if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
                    if (value.length >=20 || value.length <= 8) {return 'độ dài lớn hơn 8 và nhỏ hơn 20';} // Return an error message if the name is empty
                    if (!checkLowerCase(value)&&!checkUpperCase(value)&&!checkNumber(value)&&!checkSpecialCase(value)) 
                    {return 'phải chứa ít nhất 1 kí tự số, ít nhất1 kí tự đặc biệt, ít nhất 1 kí tự in thường và ít nhất 1 kí tự in hoa';} // Return an error message if the name is empty
                    return null; // Return null if the email is valid
                  },
                  // maxLength: 20,
                  onSaved: (value) {
                    _email = value!; // Save the entered email
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmController,
                  decoration: InputDecoration(labelText: 'Confirm password', border: OutlineInputBorder()), // Label for the email field
                  validator: (value) {
                  if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
                  if (value != passController.text) {return 'Not Match';} // Return an error message if the name is empty
                    return null; // Return null if the email is valid
                  },
                  onSaved: (value) {
                    _email = value!; // Save the entered email
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                        setState(() {isLoading = true;});
                        await Future.delayed(Duration(seconds: 2));
                        //create data
                        final user = User(
                            name: nameController.text,
                            phone: int.parse(phoneController.text) ,
                            email: emailController.text,
                            pass: passController.text,
                            confirm: confirmController.text);
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
            ],
          ),
        ),
      ),
    );
  }
}
