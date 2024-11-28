abstract interface class Usecase<SuccessType, Params> {
  Future<SuccessType> call(Params params);
}

final class NoParams {}
