import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState<T> with _$SearchState<T> {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loadingStatee() = LoadingStatee;
  const factory SearchState.errorStatee(String error) = ErrorStatee;
  const factory SearchState.successStatee(T daata) = SuccessStatee<T>;
}
