import 'package:flutter/material.dart';
import 'package:miniproject/provider/authprovider.dart';
import 'package:miniproject/style.dart';
import 'package:miniproject/widget/customButton.dart';
import 'package:miniproject/widget/CustomTextField.dart';
import 'package:intl/intl.dart';
import 'package:miniproject/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _namaLengkap = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _tanggalLahir = TextEditingController();
  String? _jenisKelamin;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  bool obsecurepassword = true;
  bool obsecureconfirmpassword = true;

  bool _isPassword8c = true;

  bool _isPasswordcapital = true;

  bool _passwordconfirmed = true;

  bool _term = false;
  bool _suscribe = false;

  bool get isRegistrationEnabled =>
      _namaLengkap.text.isNotEmpty &&
      _username.text.isNotEmpty &&
      _email.text.isNotEmpty &&
      _tanggalLahir.text.isNotEmpty &&
      _jenisKelamin != null &&
      _password.text.isNotEmpty &&
      _confirmpassword.text.isNotEmpty &&
      _passwordconfirmed &&
      _term &&
      _isPassword8c &&
      _isPasswordcapital;

  late AuthProvider _authProvider;

  @override
  void initState() {
    _authProvider = AuthProvider();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _namaLengkap.dispose();
    _username.dispose();
    _tanggalLahir.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (pickedDate != null && pickedDate != _tanggalLahir) {
      final formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      setState(() {
        _tanggalLahir.text = formattedDate;
      });
    }
  }

  void checkPassword(String password) {
    bool isPassword8c = password.length >= 8;
    bool isPasswordcapital = password.contains(RegExp(r'[A-Z]'));
    _isPassword8c = isPassword8c;
    _isPasswordcapital = isPasswordcapital;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: ListView(
        children: [
          const Text(
            "Daftar Akun Baru",
            style: Styles.HeaderText,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: _namaLengkap,
              hint: "Masukan Nama Lengkap",
              label: "Nama Lengkap"),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: _username,
              hint: "Masukan Username",
              label: "Username"),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _email,
            hint: "Masukan Email",
            label: "Email",
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _tanggalLahir,
                  hint: "YYYY-MM-DD",
                  label: "Tanggal Lahir",
                  readOnly: true,
                  sufficIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    color: Styles.black,
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jenis Kelamin",
                      style: Styles.Text16,
                    ),
                    DropdownButtonFormField<String>(
                      value: _jenisKelamin,
                      onChanged: (String? newValue) {
                        setState(() {
                          _jenisKelamin = newValue!;
                        });
                      },
                      items: <String>['Laki-laki', 'Perempuan', 'Lainnya']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Pilih",
                          hintStyle: Styles.inputTextHintDefaultTextStyle,
                          filled: true,
                          fillColor: Styles.inputTextDefaultBackgroundColor),
                      style: Styles.inputTextDefaultTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //password
          CustomTextField(
            controller: _password,
            hint: "Masukan password",
            label: "Password",
            onChanged: (value) {
              setState(() {
                checkPassword(value);
              });
            },
            obscureText: obsecurepassword,
            sufficIcon: IconButton(
              icon: const Icon(Icons.visibility),
              color: Styles.lightgrey,
              onPressed: () {
                setState(() {
                  obsecurepassword = !obsecurepassword;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              if (_isPassword8c == false)
                Expanded(
                  child: RichText(
                      text: const TextSpan(style: Styles.Text16, children: [
                    TextSpan(
                        text: "*",
                        style: TextStyle(color: Styles.red, fontSize: 10)),
                    TextSpan(
                        text: "Panjang Minimal 8 Character",
                        style: Styles.detailTextStyle),
                  ])),
                ),
              if (_isPasswordcapital == false)
                Expanded(
                  child: RichText(
                      text: const TextSpan(style: Styles.Text16, children: [
                    TextSpan(
                        text: "*",
                        style: TextStyle(color: Styles.red, fontSize: 10)),
                    TextSpan(
                        text: "Mengandung minimal 1 huruf kapital",
                        style: Styles.detailTextStyle),
                  ])),
                )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //Password Confirm
          CustomTextField(
            controller: _confirmpassword,
            hint: "Masukan ulang Password",
            label: "Masukan Ulang Password",
            obscureText: obsecureconfirmpassword,
            onChanged: (value) {
              setState(() {
                if (_password.text != value) {
                  _passwordconfirmed = false;
                } else if (_password.text == value) {
                  _passwordconfirmed = true;
                }
              });
            },
            sufficIcon: IconButton(
              icon: const Icon(Icons.visibility),
              color: Styles.lightgrey,
              onPressed: () {
                setState(() {
                  obsecureconfirmpassword = !obsecureconfirmpassword;
                });
              },
            ),
          ),
          if (_passwordconfirmed == false)
            RichText(
                text: const TextSpan(style: Styles.Text16, children: [
              TextSpan(
                  text: "*", style: TextStyle(color: Styles.red, fontSize: 10)),
              TextSpan(
                  text: "Password tidak sama", style: Styles.detailTextStyle),
            ])),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Checkbox(
                value: _term,
                onChanged: (value) {
                  setState(() {
                    _term = value!;
                  });
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
              ),
              Expanded(
                child: RichText(
                    text: const TextSpan(
                        style: Styles.detailTextStyle,
                        children: [
                      TextSpan(
                          text:
                              "Dengan mendaftar Anda dianggap telah membaca dan menyetujui  "),
                      TextSpan(
                          text: "Aturan Penggunaan dan kebijakan ",
                          style: Styles.detailLinkTextStyle),
                      TextSpan(text: "yang berlaku."),
                    ])),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Checkbox(
                value: _suscribe,
                onChanged: (value) {
                  setState(() {
                    _suscribe = value!;
                  });
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
              ),
              const Expanded(
                child: Text(
                  "Saya ingin menerima email subscribtion pemberitahuan dari Metrodata Academy.",
                  style: Styles.detailTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            label: 'Daftar',
            onPressed: () {
              onRegister(context);
            },
            minimumsize: const Size.fromHeight(40),
          ),

          Row(
            children: [
              const Text(
                "Sudah punya Akun?",
                style: Styles.detailTextStyle,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                child: const Text(
                  " Masuk disini",
                  style: Styles.detailLinkTextStyle,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  onRegister(BuildContext context) async {
    if (isRegistrationEnabled) {
      dynamic result = await _authProvider.register(
          _email.text,
          _username.text,
          _jenisKelamin!,
          _tanggalLahir.text,
          _password.text,
          _namaLengkap.text);
      if (result != null && result["message"] == "Success") {
        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => const LoginPage()));
      } else if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result["message"]),
          duration: const Duration(seconds: 3),
        ));
      }
      ;
    } else {
      print("object");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Please fill in all fields, ensure passwords match, and agree with terms.'),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
