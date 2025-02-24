// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'const.dart';
// import 'string_extension.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green, // Set the app's primary theme color
//       ),
//       title: 'Flutter Form Example',
//       home: MyForm(),
//     );
//   }
// }
//
// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // A key for managing the form
//   String _name = ''; // Variable to store the entered name
//   String _email = ''; // Variable to store the entered email
//   final TextEditingController _pass = TextEditingController();
//   final TextEditingController _confirmPass = TextEditingController();
//
//
//   // alphanumeric
//   // static final  validCharName = RegExp(r'^[a-zA-Z]+$');
//   // static final  validCharPhone = RegExp(r'^[0-9]+$');
//   // static final  validCharEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   void _submitForm() {
//     // Check if the form is valid
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save(); // Save the form data
//       // You can perform actions with the form data here and extract the details
//       print('Name: $_name'); // Print the name
//       print('Email: $_email'); // Print the email
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Form Example'),
//       ),
//       body: Form(
//         key: _formKey, // Associate the form key with this Form widget
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               // Name
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()), // Label for the name field
//                   validator: (value) {
//                     if (value!.isEmpty) {return ValidatorMessage.nameNotEmpty;} // Return an error message if the name is empty
//                     if (!RegexValidator.validCharName.hasMatch(value)) {return ValidatorMessage.nameNotIncludeNumberAndSpecialChar;}
//                     return null; // Return null if the name is valid
//                   },
//                   onSaved: (value) {_name = value!; }, // Save the entered name
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(labelText: 'Phone number', border: OutlineInputBorder()), // Label for the name field
//                   validator: (value) {
//                     if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
//                     if (value.length < 10) {return 'phone number phải theo chuẩn phone number việt nam. 10 số';} // Return an error message if the name is empty
//                     return null; // Return null if the name is valid
//                   },
//                   inputFormatters: <TextInputFormatter>[
//                     FilteringTextInputFormatter.digitsOnly
//                   ], // Only numbers can be entered
//                   maxLength: 10,
//
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()), // Label for the email field
//                   validator: (value) {
//                     if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
//                     if (!RegexValidator.validCharName.hasMatch(value)) {return 'Email theo chuẩn email';} // Return an error message if the name is empty
//                     return null; // Return null if the email is valid
//                   },
//                   onSaved: (value) {
//                     _email = value!; // Save the entered email
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: _pass,
//                   decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()), // Label for the email field
//                   validator: (value) {
//                     if(value!.checkNumber() || value.checkUpperCase()){
//
//                     }
//                     if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
//                     if (value.length >=20 || value.length <= 8) {return 'độ dài lớn hơn 8 và nhỏ hơn 20';} // Return an error message if the name is empty
//                     if (!StringExtension.checkLowerCase(value)&&!checkUpperCase(value)&&!checkNumber(value)&&!checkSpecialCase(value))
//                     {return 'phải chứa ít nhất 1 kí tự số, ít nhất1 kí tự đặc biệt, ít nhất 1 kí tự in thường và ít nhất 1 kí tự in hoa';} // Return an error message if the name is empty
//
//                     return null; // Return null if the email is valid
//                   },
//                   // maxLength: 20,
//                   onSaved: (value) {
//                     _email = value!; // Save the entered email
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: _confirmPass,
//                   decoration: InputDecoration(labelText: 'Confirm password', border: OutlineInputBorder()), // Label for the email field
//                   validator: (value) {
//                   if (value!.isEmpty) {return 'Please enter your name.';} // Return an error message if the name is empty
//                   if (value != _pass.text) {return 'Not Match';} // Return an error message if the name is empty
//
//                     return null; // Return null if the email is valid
//                   },
//                   onSaved: (value) {
//                     _email = value!; // Save the entered email
//                   },
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _submitForm, // Call the _submitForm function when the button is pressed
//                 child: Text('Submit'), // Text on the button
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
