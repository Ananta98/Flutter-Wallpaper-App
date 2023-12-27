class ApiResponse<T> {
  bool success;
  List<T> data;
  String message;

  ApiResponse({required this.success, required this.data, required this.message});
}