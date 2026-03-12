import 'package:dartz/dartz.dart';
import '../errors/failures.dart';
import 'network_info.dart';

Future<Either<Failure, T>> safeApiCall<T>(
  NetworkInfo networkInfo,
  Future<T> Function() apiCall,
) async {
  if (await networkInfo.isConnected) {
    try {
      final result = await apiCall();
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  } else {
    return Left(const NetworkFailure('No internet connection'));
  }
}
