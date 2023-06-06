import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // This widget is the root of your application.

  GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt7DEez5GDp4wS0pjZoALQLmiJkI4V7KesQXcy0ng&s',
                      scale: 1.0),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Welcome to Hakim',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 12, color: Color(0xff909881)),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    child: TextFormField(
                      controller: EmailController,
                      validator: (text){
                        if(text!.length<8){
                          return 'Oops Your Email Is Not Correct';


                        } else{
                          return null;
                        }

                      },
                      decoration: InputDecoration(
                          hintText: 'Your Email',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Color(0xff909881)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      controller: PasswordController,
                      obscureText: obscureText,
                      validator: (text){
                        if(text!.length<6 && text.isEmpty)
                        {

                          return 'Oops Your Password Is Not Correct';
                        } else{
                          return null;


                        }
                      },

                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Color(0xff909881)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  obscureText=!obscureText;
                                });
                              },
                              icon: Icon(Icons.visibility_off)
                          ),
                          prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 57,
                      child: ElevatedButton(
                          onPressed: () {
                            if(_globalKey.currentState!.validate()){

                              login();
                              Navigator.pushNamed(context, 'bottomBar');


                            }



                          }, child: Text('Sign In'))),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Spacer(),
                      Text('OR'),
                      Spacer(),
                      SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 1,
                          height: 4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEBF0FF)),
                        borderRadius: BorderRadius.circular(3)),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.network(
                            'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Center(
                            child: Text(
                              'Login with Google',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff909881)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEBF0FF)),
                        borderRadius: BorderRadius.circular(3)),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Center(
                            child: Text(
                              'Login with Facebook',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff909881)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have a account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'regis');
                          },
                          child: Text('Register ')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future login() async {
    try {
      final response =
      await Dio().post('https://api.escuelajs.co/api/v1/auth/login',
          data: {
        'email': EmailController.text,
        'password': PasswordController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('welcome')));

      Navigator.pushReplacementNamed(context, 'bottomBar');

      final SharedPreferences prefs= await SharedPreferences.getInstance();
      final accessToken= await prefs.setString('access_token', response.data['access_token']);


      return response;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(' you dont have account${e.response!.data['message']}')));
      }
    }
  }
}
