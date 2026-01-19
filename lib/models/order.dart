import 'cart_item.dart';
import 'address.dart';

enum OrderStatus {
  placed,
  packed,
  shipped,
  delivered,
  cancelled,
}

enum PaymentMethod {
  cashOnDelivery,
  upi,
  creditCard,
  debitCard,
  wallet,
}

class Order {

  final String id;
  final String userId;
  final List<CartItem> items;
  final double subtotal;
  final double deliveryCharge;
  final double tax;
  final double totalAmount;
  final Address deliveryAddress;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  final DateTime orderDate;
  final DateTime? estimatedDeliveryDate;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.deliveryCharge,
    required this.tax,
    required this.totalAmount,
    required this.deliveryAddress,
    required this.status,
    required this.paymentMethod,
    required this.orderDate,
    this.estimatedDeliveryDate,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.placed:
        return 'Order Placed';
      case OrderStatus.packed:
        return 'Packed';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get paymentMethodText {
    switch (paymentMethod) {
      case PaymentMethod.cashOnDelivery:
        return 'Cash on Delivery';
      case PaymentMethod.upi:
        return 'UPI';
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.wallet:
        return 'Wallet';
    }
  }

  bool get canCancel => status == OrderStatus.placed || status == OrderStatus.packed;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'deliveryCharge': deliveryCharge,
      'tax': tax,
      'totalAmount': totalAmount,
      'deliveryAddress': deliveryAddress.toJson(),
      'status': status.index,
      'paymentMethod': paymentMethod.index,
      'orderDate': orderDate.toIso8601String(),
      'estimatedDeliveryDate': estimatedDeliveryDate?.toIso8601String(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List).map((item) => CartItem.fromJson(item)).toList(),
      subtotal: json['subtotal'].toDouble(),
      deliveryCharge: json['deliveryCharge'].toDouble(),
      tax: json['tax'].toDouble(),
      totalAmount: json['totalAmount'].toDouble(),
      deliveryAddress: Address.fromJson(json['deliveryAddress']),
      status: OrderStatus.values[json['status']],
      paymentMethod: PaymentMethod.values[json['paymentMethod']],
      orderDate: DateTime.parse(json['orderDate']),
      estimatedDeliveryDate: json['estimatedDeliveryDate'] != null
          ? DateTime.parse(json['estimatedDeliveryDate'])
          : null,
    );
  }
}
