import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_doc/core/networking/api_error_handler.dart';
import 'package:task_doc/core/networking/api_result.dart';
import 'package:task_doc/features/home/data/repos/home_repo.dart';
import 'package:task_doc/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  void getSpecializations() async {
    emit(HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }
}
