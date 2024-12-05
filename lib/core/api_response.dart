import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  final T data;
  final String? message;
  final String? status;

  const ApiResponse({this.message, this.status, required this.data});

  @override
  List<Object?> get props => [data, message, status];
}
