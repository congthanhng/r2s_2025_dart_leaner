
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  final focus = FocusNode();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 54, right: 54, top: 72, bottom: 18),
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    ///Name input
                    CommonTextField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      focus: focus,
                      hintText: 'Full name',
                      onValidator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Bạn chưa nhập tên";
                        } else if (value.length < 8) {
                          return "Tên phải có ít nhất 8 ký tự ";
                        }
                        return null;
                      },
                    ),

                    /// Phone number input
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      validator: (value) {
                        RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                        if (value!.trim().isEmpty) {
                          return "Bạn chưa nhập số điện thoại";
                        } else if (!regex.hasMatch(value)) {
                          return "Số điện thoại không hợp lệ";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone number',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),

                        ///
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red), // Màu viền khi có lỗi
                        ),
                      ),
                    ),

                    /// Email input
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        if (value!.trim().isEmpty) {
                          return "Bạn chưa nhập email";
                        } else if (!regex.hasMatch(value)) {
                          return "Email không chính xác, vui lòng nhập lại";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red), // Màu viền khi có lỗi
                        ),
                      ),
                    ),

                    /// Password input
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: _passwordController,
                      obscureText: obscureTextPassword,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value!.trim().isEmpty) {
                          return "Bạn chưa nhập mật khẩu";
                        } else if (value.length < 8 || value.length > 20) {
                          return "Mật khẩu phải có ít nhất 8 ký tự và không quá 20 ký tự";
                        } else if (!regex.hasMatch(value)) {
                          return "Mật khẩu phải có ít nhât 1 ký tự viết hoa, 1 ký tự số, 1 ký tự đặc biệt";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextPassword = !obscureTextPassword;
                            });
                          },
                          icon: Icon(
                            obscureTextPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),

                        ///
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red), // Màu viền khi có lỗi
                        ),
                      ),
                    ),

                    /// Confirm password input
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: _confirmPasswordController,
                      obscureText: obscureTextConfirmPassword,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return "Mật khẩu chưa trùng khớp, vui lòng kiểm tra lại";
                        } else if (_passwordController.text.isEmpty) {
                          return "Bạn chưa nhập mật khẩu";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextConfirmPassword =
                                  !obscureTextConfirmPassword;
                            });
                          },
                          icon: Icon(
                            obscureTextConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),

                        ///
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red), // Màu viền khi có lỗi
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            /// SIGN UP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Form is valid, ${_formKey.currentState?.validate()}'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAD3F32),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(500, 44),
                    maximumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  )),
            ),

            /// TEXT BUTTON
            TextButton(
              onPressed: () {},
              child: const Text('Already have account? Login',
                  style: TextStyle(
                    color: Color(0xFFAD3F32),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFAD3F32),
                    decorationThickness: 1.5,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.focus,
    this.controller,
    this.onValidator,
    this.hintText,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final FocusNode? focus;
  final String? Function(String?)? onValidator;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focus;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focus = widget.focus ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTapOutside: (event) {
        _focus.unfocus();
      },
      keyboardType: widget.keyboardType,
      controller: _controller,
      focusNode: _focus,
      validator: widget.onValidator,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),

        ///
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Màu viền khi có lỗi
        ),
      ),
    );
  }
}
