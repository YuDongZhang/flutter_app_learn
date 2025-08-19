import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ninghao_demo_messages_all.dart';

class NinghaoDemoLocalizations {
  static NinghaoDemoLocalizations? of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
        context, NinghaoDemoLocalizations);
  }

  static Future<NinghaoDemoLocalizations> load(Locale locale) {
    //判断本地的城市码是否为空
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name); //规范表示本地化的代号

    return initializeMessages(localeName).then((bool _) {
      //then处理的到的数据
      Intl.defaultLocale = localeName;
      return NinghaoDemoLocalizations();
    });
  }

  String get title =>
      Intl.message('hello', name: 'title', desc: 'demo localizations');

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone',
        args: [name],
      );
}

class NinghaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<NinghaoDemoLocalizations> {
  NinghaoDemoLocalizationsDelegate();

  //load 会重建依赖这些小部件的资源
  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    return NinghaoDemoLocalizations.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<NinghaoDemoLocalizations> old) {
    return false;
  }
}

//生成 arb文件
//C:\AndroidStudioProjects\flutter_app_learn>flutter pub pub run intl_translation:extract_to_arb --output-dir=20-宁浩
// 教程练习/demo/i18n/intl  linghao/demo/i18n/intl/ninghao_demo_localizations.dart

//更具 arb生成dart
// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=ninghao_demo_ --output-dir-lib/demo/i18n/intl/--no-use-deferred-loading lib/demo/i18n/intl/ninghao_demo_localizations.dart lib/demo/i18n/intl/intl_*.arb
