import 'package:intl/intl.dart';

class NinghaoDemoLocalizetions {
  String get title =>
      Intl.message('hello', name: 'title', desc: 'demo localizations');

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone',
        args: [name],
      );
}

//生成 arb文件
//C:\AndroidStudioProjects\flutter_app_learn>flutter pub pub run intl_translation:extract_to_arb --output-dir=20-宁浩
// 教程练习/demo/i18n/intl  20-宁浩教程练习/demo/i18n/intl/ninghao_demo_localizations.dart