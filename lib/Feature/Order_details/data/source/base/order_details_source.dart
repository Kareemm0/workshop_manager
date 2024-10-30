abstract class OrderDetailsSource {
  Future<Map<String, dynamic>> orderDetails(String id);
  Future<Map<String, dynamic>> cancelOrder(
    String id, {
    required String cancelOrder,
  });
}
