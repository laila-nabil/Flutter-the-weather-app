part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  @override
  List<Object> get props => [];
}
class SelectLanguageState extends LanguageState{
  final LanguagesEnum language;

  const SelectLanguageState(this.language);
  @override
  List<Object?> get props => [language];

}