import 'package:flutter/foundation.dart';
import '../models/order.dart';
import '../models/cart_item.dart';
import '../models/address.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  List<Order> get activeOrders {
    return _orders
        .where((order) =>
            order.status != OrderStatus.delivered &&
            order.status != OrderStatus.cancelled)
        .toList();
  }

  List<Order> get completedOrders {
    return _orders
        .where((order) =>
            order.status == OrderStatus.delivered ||
            order.status == OrderStatus.cancelled)
        .toList();
  }

  void addOrder(
    String userId,
    List<CartItem> items,
    double subtotal,
    double deliveryCharge,
    double tax,
    double totalAmount,
    Address deliveryAddress,
    PaymentMethod paymentMethod,
  ) {
    final order = Order(
      id: 'ORD${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      items: items,
      subtotal: subtotal,
      deliveryCharge: deliveryCharge,
      tax: tax,
      totalAmount: totalAmount,
      deliveryAddress: deliveryAddress,
      status: OrderStatus.placed,
      paymentMethod: paymentMethod,
      orderDate: DateTime.now(),
      estimatedDeliveryDate: DateTime.now().add(const Duration(days: 5)),
    );

    _orders.insert(0, order);
    notifyListeners();
  }

  void updateOrderStatus(String orderId, OrderStatus newStatus) {
    final orderIndex = _orders.indexWhere((order) => order.id == orderId);
    if (orderIndex >= 0) {
      final order = _orders[orderIndex];
      final updatedOrder = Order(
        id: order.id,
        userId: order.userId,
        items: order.items,
        subtotal: order.subtotal,
        deliveryCharge: order.deliveryCharge,
        tax: order.tax,
        totalAmount: order.totalAmount,
        deliveryAddress: order.deliveryAddress,
        status: newStatus,
        paymentMethod: order.paymentMethod,
        orderDate: order.orderDate,
        estimatedDeliveryDate: order.estimatedDeliveryDate,
      );
      _orders[orderIndex] = updatedOrder;
      notifyListeners();
    }
  }

  void cancelOrder(String orderId) {
    updateOrderStatus(orderId, OrderStatus.cancelled);
  }

  Order? getOrderById(String orderId) {
    try {
      return _orders.firstWhere((order) => order.id == orderId);
    } catch (e) {
      return null;
    }
  }
}
