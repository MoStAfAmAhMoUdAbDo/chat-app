import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loadingState() = LoadingState;
  const factory SignInState.successState() = SuccessState;
  const factory SignInState.errorState({required String error}) = ErrorState;
}
