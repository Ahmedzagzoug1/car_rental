part of 'brand_cubit.dart';

sealed class BrandState extends Equatable {
  const BrandState();
}

 class BrandInitial extends BrandState {
  @override
  List<Object> get props => [];
}
 class BrandLoaded extends BrandState{
 final List<BrandEntity>brands;
 const BrandLoaded({required this.brands});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 class BrandLoading extends BrandState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 class BrandFailure extends BrandState{
final String errorMessage;

  const BrandFailure(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}