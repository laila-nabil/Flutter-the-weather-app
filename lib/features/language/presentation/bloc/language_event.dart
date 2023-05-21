part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class SelectLanguage extends LanguageEvent{
  final LanguagesEnum language;

  const SelectLanguage(this.language);
  @override
  List<Object?> get props => [language];

}