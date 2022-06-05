import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/api/api_data.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<GetApiEvent>((event, emit) async {
      emit(ApiLoading());
      try {
        String str = await getString();
        emit(ApiSuccess(str));
      } catch (e) {
        emit(ApiError());
      }
    });
    on<refreshApiEvent>(((event, emit) => emit(ApiInitial())));
  }
}
