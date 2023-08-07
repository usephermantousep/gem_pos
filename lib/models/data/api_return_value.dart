part of '../models.dart';

class ApiReturnValue<T> extends Equatable {
  final T? value;
  final String? message;

  const ApiReturnValue({this.value, this.message});

  @override
  List<Object?> get props => [value, message];
}
