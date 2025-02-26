// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class MyLocalizationsRu extends MyLocalizations {
  MyLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get hello => 'Privet';

  @override
  String get email => 'Email';

  @override
  String get password => 'Parol';

  @override
  String get login => 'Kirish';

  @override
  String get fullName => 'Ism';

  @override
  String get mobilNumber => 'Telefon raqami';

  @override
  String get dataofBirth => 'Tug\'ilgan kuni';

  @override
  String get confirmPassword => 'Qayta parol kiriting';

  @override
  String get signup => 'Ro\'yhatdan o\'tish';
}
