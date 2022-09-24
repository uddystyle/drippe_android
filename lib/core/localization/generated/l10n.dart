// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I10n {
  I10n();

  static I10n? _current;

  static I10n get current {
    assert(_current != null,
        'No instance of I10n was loaded. Try to initialize the I10n delegate before accessing I10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I10n();
      I10n._current = instance;

      return instance;
    });
  }

  static I10n of(BuildContext context) {
    final instance = I10n.maybeOf(context);
    assert(instance != null,
        'No instance of I10n present in the widget tree. Did you add I10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I10n? maybeOf(BuildContext context) {
    return Localizations.of<I10n>(context, I10n);
  }

  /// `Beans(g)`
  String get beans {
    return Intl.message(
      'Beans(g)',
      name: 'beans',
      desc: '',
      args: [],
    );
  }

  /// `Tap`
  String get input {
    return Intl.message(
      'Tap',
      name: 'input',
      desc: '',
      args: [],
    );
  }

  /// `Hot Water(g)`
  String get water {
    return Intl.message(
      'Hot Water(g)',
      name: 'water',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message(
      'Stop',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `Edit Alarm`
  String get editAlarm {
    return Intl.message(
      'Edit Alarm',
      name: 'editAlarm',
      desc: '',
      args: [],
    );
  }

  /// `Add Alarm`
  String get addAlarm {
    return Intl.message(
      'Add Alarm',
      name: 'addAlarm',
      desc: '',
      args: [],
    );
  }

  /// `Edit Recipe`
  String get editRecipe {
    return Intl.message(
      'Edit Recipe',
      name: 'editRecipe',
      desc: '',
      args: [],
    );
  }

  /// `Add Recipe`
  String get addRecipe {
    return Intl.message(
      'Add Recipe',
      name: 'addRecipe',
      desc: '',
      args: [],
    );
  }

  /// `Ratio`
  String get ratio {
    return Intl.message(
      'Ratio',
      name: 'ratio',
      desc: '',
      args: [],
    );
  }

  /// `Please create a recipe`
  String get emptyRatio {
    return Intl.message(
      'Please create a recipe',
      name: 'emptyRatio',
      desc: '',
      args: [],
    );
  }

  /// `Recipe`
  String get recipeTitle {
    return Intl.message(
      'Recipe',
      name: 'recipeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Alarm`
  String get alarmTitle {
    return Intl.message(
      'Alarm',
      name: 'alarmTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Label`
  String get label {
    return Intl.message(
      'Label',
      name: 'label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a label`
  String get labelHint {
    return Intl.message(
      'Please enter a label',
      name: 'labelHint',
      desc: '',
      args: [],
    );
  }

  /// `Ratio of beans to hot water`
  String get ratioTitle {
    return Intl.message(
      'Ratio of beans to hot water',
      name: 'ratioTitle',
      desc: '',
      args: [],
    );
  }

  /// `Standard:16`
  String get stdRatio {
    return Intl.message(
      'Standard:16',
      name: 'stdRatio',
      desc: '',
      args: [],
    );
  }

  /// `Conditional Beans`
  String get beanCondition {
    return Intl.message(
      'Conditional Beans',
      name: 'beanCondition',
      desc: '',
      args: [],
    );
  }

  /// `Light roasts`
  String get light {
    return Intl.message(
      'Light roasts',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Cinnamon roasts`
  String get cinnamon {
    return Intl.message(
      'Cinnamon roasts',
      name: 'cinnamon',
      desc: '',
      args: [],
    );
  }

  /// `Medium roasts`
  String get mediumroasts {
    return Intl.message(
      'Medium roasts',
      name: 'mediumroasts',
      desc: '',
      args: [],
    );
  }

  /// `High roasts`
  String get high {
    return Intl.message(
      'High roasts',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `City roasts`
  String get city {
    return Intl.message(
      'City roasts',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `French roasts`
  String get french {
    return Intl.message(
      'French roasts',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Italian roasts`
  String get italian {
    return Intl.message(
      'Italian roasts',
      name: 'italian',
      desc: '',
      args: [],
    );
  }

  /// `Turkish`
  String get turkish {
    return Intl.message(
      'Turkish',
      name: 'turkish',
      desc: '',
      args: [],
    );
  }

  /// `Fine`
  String get fine {
    return Intl.message(
      'Fine',
      name: 'fine',
      desc: '',
      args: [],
    );
  }

  /// `Medium fine`
  String get mediumfine {
    return Intl.message(
      'Medium fine',
      name: 'mediumfine',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Medium coarse`
  String get mediumcoarse {
    return Intl.message(
      'Medium coarse',
      name: 'mediumcoarse',
      desc: '',
      args: [],
    );
  }

  /// `Coarse`
  String get coarse {
    return Intl.message(
      'Coarse',
      name: 'coarse',
      desc: '',
      args: [],
    );
  }

  /// `Drippe`
  String get drippe {
    return Intl.message(
      'Drippe',
      name: 'drippe',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Basic Settings`
  String get basicSettings {
    return Intl.message(
      'Basic Settings',
      name: 'basicSettings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `About The App`
  String get aboutApp {
    return Intl.message(
      'About The App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact {
    return Intl.message(
      'Contact Us',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get defaultLabel {
    return Intl.message(
      'Normal',
      name: 'defaultLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I10n> load(Locale locale) => I10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
