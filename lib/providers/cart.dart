import 'package:flutter/foundation.dart';

class ChartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  ChartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price
  });
}

class Cart with ChangeNotifier {

}
