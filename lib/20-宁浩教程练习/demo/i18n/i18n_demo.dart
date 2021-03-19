import 'package:flutter/material.dart';

import 'map/ninghao_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${locale.languageCode}'),
            Text(locale.toString()),
            Text(
              Localizations.of(context, NinghaoDemoLocalizations).title,
              style: Theme.of(context).textTheme.title,
            )
          ],
        ),
      ),
    );
  }
}
