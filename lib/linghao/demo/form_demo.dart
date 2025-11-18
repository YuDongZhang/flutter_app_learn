import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///单独设置的主题
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RegisterForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RegisterForm extends StatefulWidget {
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>(); //添加一个 globalkey  , 交给表单
  late String username, password;
  bool autovalidate = false;

  void submitRegisterForm() {
    // registerFormKey.currentState.save(); //save( )意思就是保存表单的值
    // debugPrint('username$username+ password$password');
    registerFormKey.currentState?.validate(); //表单的验证
    ///表单的自动验证 , 当你输入错误后 , 再输入错误信息,会自动消失
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState?.save();
      debugPrint('username: $username');
      debugPrint('password: $password');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registering...'),
          )
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String? validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }

    return null;
  }

  String? validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'UserName',
                helperText: '', //验证的时候出现错误信息更加自然不会把输入框 挤上去
              ),
              onSaved: (value) {
                //这个相当于把值给他
                //保存表单会执行这个回调
                username = value!;
              },
              validator: validateUsername, //表单的验证
              autovalidateMode: autovalidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
            ),
            TextFormField(
              obscureText: true,
              //输入之后变成保密性
              decoration: InputDecoration(
                labelText: 'PassWord',
                helperText: '',
              ),
              onSaved: (value) {
                //保存表单会执行这个回调
                password = value!;
              },
              validator: validatePassword,
              autovalidateMode: autovalidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Register', style: TextStyle(color: Colors.white)),
                onPressed: submitRegisterForm,
              ),
            ),
          ],
        ));
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController(); //一样是监听 没有效果

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,

      ///负责输入的监听
      // onChanged: (value){
      //   debugPrint(value);
      // },
      ///点击确定按钮时候的值
      onSubmitted: (value) {
        debugPrint('submit + $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        //文本框左边的小图标
        labelText: '我是输入框',
        hintText: '点击我可以输入',
        // border: InputBorder.none,//取消了下划线
        border: OutlineInputBorder(),
        filled: true,
        // fillColor:  ,设置背景颜色
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //借用主页的主题
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
