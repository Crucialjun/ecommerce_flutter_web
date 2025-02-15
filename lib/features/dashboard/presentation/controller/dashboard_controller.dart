import 'package:ecommerce_flutter_web/features/dashboard/data/models/order_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatusEnum, int> orderStatusData =
      <OrderStatusEnum, int>{}.obs;
  final RxMap<OrderStatusEnum, double> totalAmounts =
      <OrderStatusEnum, double>{}.obs;

  static final List<OrderModel> orders = [
    OrderModel(
      id: '1',
      orderNumber: 'ORD-001',
      customerName: 'John Doe',
      orderDate: DateTime(2024, 12, 17),
      deliveryDate: DateTime(2024, 12, 17),
      status: OrderStatusEnum.delivered,
      totalAmount: 100.0,
    ),
    OrderModel(
      id: '2',
      orderNumber: 'ORD-002',
      customerName: 'Jane Doe',
      orderDate: DateTime(2024, 12, 18),
      deliveryDate: DateTime(2024, 12, 18),
      status: OrderStatusEnum.shipped,
      totalAmount: 200.0,
    ),
    OrderModel(
      id: '3',
      orderNumber: 'ORD-003',
      customerName: 'John Doe',
      orderDate: DateTime(2024, 12, 19),
      deliveryDate: DateTime(2024, 12, 19),
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
    OrderModel(
      id: '5',
      orderNumber: 'ORD-005',
      customerName: 'John Doe',
      orderDate: DateTime(2024, 12, 21),
      deliveryDate: DateTime(2024, 12, 21),
      status: OrderStatusEnum.delivered,
      totalAmount: 500.0,
    ),
    OrderModel(
      id: '6',
      orderNumber: 'ORD-006',
      customerName: 'Jane Doe',
      orderDate: DateTime(2024, 12, 22),
      deliveryDate: DateTime(2024, 12, 22),
      status: OrderStatusEnum.shipped,
      totalAmount: 600.0,
    ),
    OrderModel(
      id: '7',
      orderNumber: 'ORD-007',
      customerName: 'John Doe',
      orderDate: DateTime(2024, 12, 16),
      deliveryDate: DateTime(2024, 12, 16),
      status: OrderStatusEnum.processing,
      totalAmount: 700.0,
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();

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

  void _calculateOrderStatusData() {
    orderStatusData.clear();

    totalAmounts.value = {
      for (var status in OrderStatusEnum.values) status: 0.0
    };

    for (var order in orders) {
      orderStatusData[order.status] = (orderStatusData[order.status] ?? 0) + 1;
      totalAmounts[order.status] =
          (totalAmounts[order.status] ?? 0) + order.totalAmount;
    }
  }
}
