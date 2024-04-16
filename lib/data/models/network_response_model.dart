class NetworkResponseModel<T> {
  final T? result;
  final bool isError;

  NetworkResponseModel({
    this.result,
    this.isError = false,
  });
}
