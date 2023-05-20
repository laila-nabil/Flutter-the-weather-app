import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure() : super(message: "");

  @override
  List<Object?> get props => [];
}
