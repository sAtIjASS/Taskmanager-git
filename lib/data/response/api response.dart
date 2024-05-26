import 'package:sf_p/data/response/states of api.dart' as ApiStatus;

class Api<T> {
  ApiStatus.Status? status;
  T? data;
  String message;

  Api(this.status, this.data, this.message);
  Api.loading() : status = ApiStatus.Status.loading;
  Api.completing(T data) : status = ApiStatus.Status.completing, this.data = data;

  Api.error(this.message) : status = ApiStatus.Status.error;

  @override
  String toString() {
    return "Status: $status \nMessage: $message \nData: $data";
  }
}

enum Status {
  loading,
  completing,
  error,
}
