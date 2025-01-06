import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/fetch_more_images_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/repository/media_repository.dart';

class FetchMoreImagesUsecase with UseCases<List<ImageModel>,FetchMoreImagesParams> {
  final _repository = locator<MediaRepository>();
  @override
  Future<Either<Failure, List<ImageModel>>> call(FetchMoreImagesParams params) {
    return _repository.loadMoreImages(params: params);
  }
}