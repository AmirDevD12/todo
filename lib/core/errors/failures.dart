abstract class Failure {
  final String? header;
  final String? body;

  const Failure(this.header, this.body);
}

class GeneralFailure extends Failure {
  GeneralFailure(String header, String body) : super(header, body);

  @override
  String get header => super.header!;
  @override
  String get body => super.body!;
}
