import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obscureText = true;
  bool obscureText2 = true;

  final Forms = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController Passwordone = TextEditingController();
  TextEditingController PasswordTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: 1000,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 121,
              ),
             CircleAvatar(
               radius: 80,
               backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR63KoribGVDB_dswx8iUX99udIebJK_EsaYYTwg2vJoIeIECXhO8iWnI5VBU64wLJ-8gg&usqp=CAU'),
             ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Lets Get Started',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff223263)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Create an new account',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9098B1)),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: Forms,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (Texts) {
                            if (Texts!.length <= 5) {
                              return 'Register your name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                color: Color(0xff9098B1),
                                fontSize: 12,
                              ),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.account_circle_outlined)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: EmailController,
                          validator: (Texts) {
                            if (Texts!.length <= 3) {
                              return 'Register your Email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Full Email',
                              hintStyle: TextStyle(
                                color: Color(0xff9098B1),
                                fontSize: 12,
                              ),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.mail_outline_rounded)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: Passwordone,
                          validator: (Texts) {
                            if (Texts!.length <= 3) {
                              return 'Register your Password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              color: Color(0xff9098B1),
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: obscureText
                                    ? Icon(Icons.visibility_off_rounded)
                                    : Icon(Icons.visibility)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: PasswordTwo,
                          validator: (Texts) {
                            if (Texts!.length <= 3) {
                              return 'Register your Password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: obscureText2,
                          decoration: InputDecoration(
                            hintText: 'Password Again',
                            hintStyle: TextStyle(
                              color: Color(0xff9098B1),
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText2 = !obscureText2;
                                  });
                                },
                                icon: obscureText2
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.visibility)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 57,
                          margin: EdgeInsets.only(left: 16, right: 16),
                          color: Color(0xff40BFFF),
                          child: ElevatedButton(
                              onPressed: () {
                                if (Forms.currentState!.validate()) {
                                  if (Passwordone.text == PasswordTwo.text) {
                                    register();
                                    Navigator.pushNamed(context, 'Login');
                                  }
                                }
                              },
                              child: Text(
                                'Sign UP',
                                style: TextStyle(fontSize: 15),
                              )),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    )));
  }

  Future register() async {
    try {
      final data =
          await Dio().post('https://api.escuelajs.co/api/v1/users/', data: {
        'name': nameController.text,
        'email': EmailController.text,
        'password': Passwordone.text,
        'avatar': 'https://api.lorem.space/image/face?w=640&h=480'
      });

      return data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${e.response!.data['message']}')));
      }
    }
  }
}
