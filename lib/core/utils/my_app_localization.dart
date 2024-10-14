import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension StaticAppLocalization on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
}
