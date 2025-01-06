import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/delete_image_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/repository/media_repository.dart';

class DeleteImageUsecase with UseCases<void, DeleteImageParams> {
  final _repository = locator<MediaRepository>();
  @override
  Future<Either<Failure, void>> call(DeleteImageParams params) {
    return _repository.deleteImage(params: params);
  }
}
