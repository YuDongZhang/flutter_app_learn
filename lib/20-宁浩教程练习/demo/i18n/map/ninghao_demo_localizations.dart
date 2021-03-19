import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class NinghaoDemoLocalizations {
  final Locale locale;

  NinghaoDemoLocalizations(this.locale);

  static NinghaoDemoLocalizations of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
        context, NinghaoDemoLocalizations);
  }

  //本地化的类
  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class NinghaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<NinghaoDemoLocalizations> {
  NinghaoDemoLocalizationsDelegate();

  //load 会重建依赖这些小部件的资源
  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<NinghaoDemoLocalizations>(
        NinghaoDemoLocalizations(locale));
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
