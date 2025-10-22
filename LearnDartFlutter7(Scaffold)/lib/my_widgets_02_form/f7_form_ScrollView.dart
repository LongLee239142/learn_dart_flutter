import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBasicDemo6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo6> {
  // Sử dụng GlobalKey để truy cập form
  final _formkey = GlobalKey<FormState>();

  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _dateOfBirhtController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? _name;
  String? _selectedCity;
  String? _selectedGender;
  bool _isAgreed = false;
  DateTime? _dateOfBirth;

  final List<String> _cities = [
    "Hanoi",
    "Hue",
    "Thanhhoa",
    "Nghean",
    "Quangtri",
    "Phutho",
    "Danang",
    "HCM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Basic")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Họ tên
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      _name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@gmail.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      if (!RegExp(
                        r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Email không hợp lệ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Phone number
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Số điện thoại',
                      hintText: 'Nhập số điện thoại',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập số điện thoại';
                      }
                      if (!RegExp(r'^[0-9]{10,11}$').hasMatch(value)) {
                        return 'Số điện thoại không hợp lệ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      hintText: 'Nhập mật khẩu',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Confirm Password field
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Xác nhận mật khẩu',
                      hintText: 'Nhập lại mật khẩu',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: _obscureConfirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập lại mật khẩu";
                      }
                      if (value != _passwordController.text) {
                        return "Mật khẩu xác nhận không khớp";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  // Gender (RadioListTile styled nicely with validation)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Giới tính",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormField<String>(
                    validator: (value) {
                      if (_selectedGender == null) {
                        return 'Vui lòng chọn giới tính';
                      }
                      return null;
                    },
                    builder: (state) {
                      final colorScheme = Theme.of(context).colorScheme;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container giống TextField
                          Container(
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              border: Border.all(
                                color: state.hasError
                                    ? colorScheme.error
                                    : colorScheme.outlineVariant,
                                width: 1.2,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text("Nam"),
                                    value: "Nam",
                                    groupValue: _selectedGender,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (value) {
                                      setState(() => _selectedGender = value);
                                      state.didChange(value);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text("Nữ"),
                                    value: "Nữ",
                                    groupValue: _selectedGender,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (value) {
                                      setState(() => _selectedGender = value);
                                      state.didChange(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Lỗi nếu chưa chọn
                          if (state.hasError)
                            Padding(
                              padding: const EdgeInsets.only(top: 6, left: 4),
                              child: Text(
                                state.errorText ?? '',
                                style: TextStyle(
                                  color: colorScheme.error,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedCity,
                    items: _cities.map((city) {
                      return DropdownMenuItem(value: city, child: Text(city));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui long chon thanh pho';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CheckboxListTile(
                    title: Text("I agree"),
                    value: _isAgreed,
                    onChanged: (value) {
                      setState(() {
                        _isAgreed = value!;
                        print("Agree: $_isAgreed");
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _dateOfBirhtController,
                    decoration: InputDecoration(
                      labelText: "Dob",
                      hintText: "Please chose your date of birth",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: ()async{
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025));
                      if(pickedDate != null){
                        String formatDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        setState(() {
                          _dateOfBirhtController.text = formatDate;
                          _dateOfBirth = pickedDate;
                        });
                      }
                    },
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please chose date of birth";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  // Nút Submit và Reset
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Xin chào $_name")),
                            );
                          }
                        },
                        child: Text("Submit"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formkey.currentState!.reset();
                          _fullnameController.clear();
                          _emailController.clear();
                          _phoneController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                          _dateOfBirhtController.clear();
                          setState(() {
                            _selectedGender = null;
                            _selectedCity = null;
                            _isAgreed = false;
                            _obscurePassword = true;
                            _obscureConfirmPassword = true;
                          });
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).clearSnackBars();
                        },
                        child: Text("Reset"),
                      ),
                    ],
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
