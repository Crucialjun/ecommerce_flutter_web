import 'package:ecommerce_flutter_web/features/dashboard/data/models/order_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  static final List<OrderModel> orders = [
    OrderModel(
      id: '1',
      orderNumber: 'ORD-001',
      customerName: 'John Doe',
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now(),
      status: OrderStatusEnum.delivered,
      totalAmount: 100.0,
    ),
    OrderModel(
      id: '2',
      orderNumber: 'ORD-002',
      customerName: 'Jane Doe',
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now(),
      status: OrderStatusEnum.shipped,
      totalAmount: 200.0,
    ),
    OrderModel(
      id: '3',
      orderNumber: 'ORD-003',
      customerName: 'John Doe',
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now(),
      status: OrderStatusEnum.processing,
      totalAmount: 300.0,
    ),
    OrderModel(
      id: '4',
      orderNumber: 'ORD-004',
      customerName: 'Jane Doe',
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now(),
      status: OrderStatusEnum.pending,
      totalAmount: 400.0,
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  void _calculateWeeklySales() {
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orders) {
      final DateTime orderWeekStart =
          order.orderDate.subtract(Duration(days: order.orderDate.weekday - 1));

      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(Duration(days: 7)).isAfter(DateTime.now())) {
       int index = (order.orderDate.weekday - 1) % 7;
       index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;
      }
    }
  }
}
