import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfile> {
  // GlobalKey للتحكم في الـ Form
  final _formKey = GlobalKey<FormState>();

  // Controllers لحفظ قيم حقول الإدخال
  final TextEditingController _nameController = TextEditingController(
    text: 'Youssef Walid',
  ); // قيمة افتراضية
  final TextEditingController _emailController = TextEditingController(
    text: 'youssefwalid@gmail.com',
  ); // قيمة افتراضية
  final TextEditingController _dobController = TextEditingController(
    text: '10/6/2003',
  ); // قيمة افتراضية

  // قيمة مختارة للنوع (Gender)
  String _selectedGender = 'Male'; // قيمة افتراضية

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  // دالة لعرض منتقي التاريخ (Date Picker)
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Text("Profile", style: TextStyle(fontSize: 20)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                "Edit Personal Information",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 33),
              const Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // حقل الاسم
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xAAE2E4E8),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // حقل الإيميل
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xAAE2E4E8),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Date of Birth',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // حقل تاريخ الميلاد
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  // لمنع الكتابة المباشرة في الحقل
                  child: TextFormField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      hintText: 'Select your date of birth',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xAAE2E4E8),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date of birth cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // اختيار النوع (Gender)
              const Text(
                'Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // أزرار إلغاء وحفظ
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // إلغاء التغييرات والرجوع
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // هنا ممكن تعمل save للبيانات أو تبعتها للـ API
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saving data...')),
                          );
                          // مثال: طباعة البيانات اللي تم حفظها
                          print('Name: ${_nameController.text}');
                          print('Email: ${_emailController.text}');
                          print('Date of Birth: ${_dobController.text}');
                          print('Gender: $_selectedGender');
                          // ممكن تعمل Navigator.pop(context) بعد ما تبعت البيانات بنجاح
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // لون الزرار
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
