part of 'approval_cubit.dart';

sealed class ApprovalState extends Equatable {
  const ApprovalState();
}

final class ApprovalInitial extends ApprovalState {
  @override
  List<Object> get props => [];
}


class ApprovalLoading extends ApprovalState {
  @override
  List<Object?> get props =>[];
}

class ApprovalUpdated extends ApprovalState {
  final ApprovalEntity data;
  ApprovalUpdated(this.data);

  @override
  List<Object?> get props =>[data];
}

class ApprovalError extends ApprovalState {
  final String message;
  ApprovalError(this.message);

  @override
  List<Object?> get props => [message];
}
