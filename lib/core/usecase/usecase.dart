
import 'package:authentication_app/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type , Params> {
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithOutParams<Type> {
  ResultVoid call();
}
