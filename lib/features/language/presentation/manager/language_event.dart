part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class SelectLanguage extends LanguageEvent{
  final languagesEnum language;

  SelectLanguage(this.language);
  @override
  List<Object?> get props => [language];

}