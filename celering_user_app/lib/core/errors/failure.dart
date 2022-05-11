import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchPlaceFailure extends Failure {
  final String message;

  SearchPlaceFailure({required this.message});
}