import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_weather_app/core/utils.dart';

class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    printDebug('''
{
  "provider func type" : "didUpdateProvider",
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue"
  "newValue": "$newValue"
}''');
  }

@override
  void providerDidFail(ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
  printDebug('''
{
  "provider func type" : "providerDidFail",
  "provider": "${provider.name ?? provider.runtimeType}",
  "error": "$error"
  "stackTrace": "$stackTrace"
}''');
  }
}
