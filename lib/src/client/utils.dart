class FutureResult<T> {
  final Future<T> future;
  T? result;
  bool resolved = false;

  FutureResult(this.future) {
    future.then((value) {
      result = value;
    }).whenComplete(() {
      resolved = true;
    });
  }
}
