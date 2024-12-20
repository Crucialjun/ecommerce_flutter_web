import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String id;
  final String orderNumber;
  final String customerName;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final OrderStatusEnum status;
  final double totalAmount;

  const OrderModel(
      {required this.id,
      required this.orderNumber,
      required this.customerName,
      required this.orderDate,
      required this.deliveryDate,
      required this.status,
      required this.totalAmount});

  @override
  List<Object?> get props => [
        id,
        orderNumber,
        customerName,
        orderDate,
        deliveryDate,
        status,
        totalAmount
      ];
}

enum OrderStatusEnum {
  pending("Pending"),
  processing ("Processing"),
  shipped ("Shipped"),
  delivered ("Delivered"),
  cancelled ("Cancelled");

  const OrderStatusEnum(this.value);
  final String value;
}
