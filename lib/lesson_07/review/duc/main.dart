import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'shared_preferences_helper.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterForm(),
  ));
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _loadSavedUser();
  }

  /// Load user từ SharedPreferences
  Future<void> _loadSavedUser() async {
    final user = await SharedPreferencesHelper.getUser();
    if (user != null) {
      setState(() {
        _fullNameController.text = user['full_name'] ?? '';
        _phoneController.text = user['phone'] ?? '';
        _emailController.text = user['email'] ?? '';
        _passwordController.text = user['password'] ?? ''; // Nếu không muốn hiển thị, để chuỗi rỗng
      });
    }
  }

  /// Lưu user vào SharedPreferences
  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final newUser = {
        'full_name': _fullNameController.text,
        'phone': _phoneController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      };

      await SharedPreferencesHelper.saveUser(newUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký thành công')),
      );
      _loadSavedUser(); // Cập nhật giao diện
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EDE3),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 100),
                SizedBox(height: 20),

                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField('Full name', _fullNameController, validator: _validateFullName),
                      _buildTextField('Phone number', _phoneController,
                          keyboardType: TextInputType.phone, validator: _validatePhoneNumber),
                      _buildTextField('Email', _emailController,
                          keyboardType: TextInputType.emailAddress, validator: _validateEmail),
                      _buildTextField('Password', _passwordController,
                          obscureText: _obscurePassword,
                          toggleObscure: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          validator: _validatePassword),
                      _buildTextField('Confirm Password', _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          toggleObscure: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                          validator: (value) => _validateConfirmPassword(value, _passwordController.text)),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC04030),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: _registerUser,
                        child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType? keyboardType, bool obscureText = false, VoidCallback? toggleObscure, String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: toggleObscure != null
              ? IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: toggleObscure,
          )
              : null,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập họ tên';
    }
    if (!RegExp(r"^[a-zA-ZÀ-ỹ\s]+$").hasMatch(value)) {
      return 'Họ tên không được chứa số hoặc ký tự đặc biệt';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    if (!RegExp(r"^(0[3|5|7|8|9])[0-9]{8}$").hasMatch(value)) {
      return 'Số điện thoại không hợp lệ (phải là 10 số, bắt đầu bằng 03, 05, 07, 08 hoặc 09)';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 8 || value.length > 20) {
      return 'Mật khẩu phải có độ dài từ 8 đến 20 ký tự';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu';
    }
    if (value != password) {
      return 'Mật khẩu xác nhận không khớp';
    }
    return null;
  }
}
