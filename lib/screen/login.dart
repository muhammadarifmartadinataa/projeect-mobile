import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Asset.colorPrimaryDark,
              ),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: 20,
                bottom: 20
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Produk Smart Campus',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding:  EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                      value == '' ? 'Jangan Kosong' : null,
                      style: TextStyle(
                        color: Asset.colorPrimaryDark,
                      ),
                      decoration: InputDecoration(
                          hintText: 'username',
                          hintStyle: TextStyle(
                            color: Asset.colorPrimaryDark,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Asset.colorPrimaryDark,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Asset.colorPrimary,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Asset.colorPrimary,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.people,
                            color: Asset.colorPrimaryDark,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) =>
                      value == '' ? 'Jangan Kosong' : null,
                      style: TextStyle(
                        color: Asset.colorPrimaryDark,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Asset.colorPrimaryDark,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Asset.colorPrimaryDark,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Asset.colorPrimary,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Asset.colorPrimary,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Asset.colorPrimaryDark,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Asset.colorPrimary,
                      ),
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
