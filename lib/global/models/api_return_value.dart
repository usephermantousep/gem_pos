part of 'package:gempos/global/models.dart';

class ApiReturnValue<T> extends Equatable {
  final T? value;
  final String? message;
  final int statusCode;

  const ApiReturnValue({this.value, this.message, required this.statusCode});

  @override
  List<Object?> get props => [value, message, statusCode];
}
