import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_page_state.freezed.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState.initial() = _Initial;
  const factory ChatPageState.loading() = LoadingState;
  const factory ChatPageState.success() = SuccessState;
  const factory ChatPageState.error() = ErrorState;
}
