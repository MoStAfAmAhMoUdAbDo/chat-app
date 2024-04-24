import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loadingState() = LoadingState;
  const factory ForgotPasswordState.errorState(String error) = ErrorState;
  const factory ForgotPasswordState.successState() = SuccessState;
}
