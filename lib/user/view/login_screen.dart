import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/view/root_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    const emulatorIp = '10.0.2.2:3000';
    const simulatorIp = '127.0.0.1:3000';
    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    return DefaultLayout(
        child: SingleChildScrollView(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag, // 드레그로 키보드 숨기기
            child: SafeArea(
                top: true,
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _Title(),
                        const SizedBox(height: 16.0),
                        const _SubTitle(),
                        Image.asset(
                          'asset/img/misc/logo.png',
                          width: MediaQuery.of(context).size.width / 3 * 2,
                        ),
                        CustomTextFormField(
                          hintText: '이메일을 입력해주세요.',
                          errorText: '에러가 있습니다.',
                          onChanged: (String value) {
                            username = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextFormField(
                          hintText: '비밀번호를 입력해주세요.',
                          errorText: '에러가 있습니다.',
                          onChanged: (String value) {
                            password = value;
                          },
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            final rawString = '$username:$password';
                            Codec<String, String> stringToBase64 =
                                utf8.fuse(base64);
                            String token = stringToBase64.encode(rawString);
                            final resp = await dio.post(
                              'http://$ip/auth/login',
                              options: Options(
                                headers: {'authorization': 'Basic $token'},
                              ),
                            );
                            final refreshToken = resp.data['refreshToken'];
                            final accessToken = resp.data['accessToken'];
                            storage.write(
                                key: REFRESH_TOKEN_KEY, value: refreshToken);
                            storage.write(
                                key: ACCESS_TOKEN_KEY, value: accessToken);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const RootTab(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                          ),
                          child: const Text('로그인'),
                        ),
                        TextButton(
                          onPressed: () async {
                            const refreshToken =
                                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFhYSIsInN1YiI6ImY1NWIzMmQyLTRkNjgtNGMxZS1hM2NhLWRhOWQ3ZDBkOTJlNSIsInR5cGUiOiJyZWZyZXNoIiwiaWF0IjoxNjkwNzkxMzAwLCJleHAiOjE2OTA4Nzc3MDB9.XTV6DUbzVceZMDBLIk0kOFyewe2QQp9JaHD3G4MdpmE';
                            final resp = await dio.post(
                              'http://$ip/auth/token',
                              options: Options(
                                headers: {
                                  'authorization': 'Bearer $refreshToken'
                                },
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text(
                            '회원가입',
                          ),
                        ),
                      ]),
                ))));
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다!',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}