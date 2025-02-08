import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure?, T>> call(P params);
}

class NoParams {}
