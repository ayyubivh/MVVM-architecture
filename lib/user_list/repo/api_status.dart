// ignore_for_file: public_member_api_docs, sort_constructors_first
class Success {
  int? code;
  Object? response;
  Success({
    this.code,
    this.response,
  });
}

class Failure {
  int? code;
  Object? erroResponse;
  Failure({
    this.code,
    this.erroResponse,
  });
}
