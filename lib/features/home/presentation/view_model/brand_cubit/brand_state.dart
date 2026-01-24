part of 'brand_cubit.dart';

sealed class BrandState extends Equatable {
  const BrandState();
}

final class BrandInitial extends BrandState {
  @override
  List<Object> get props => [];
}
final class BrandLoaded extends BrandState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class BrandLoading extends BrandState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class BrandFailure extends BrandState{
final String errorMessage;

  BrandFailure(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}