import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/presentations/cubits/toggle_inerests/toggle_inerests_state.dart';

class ToggleInerestsCubit extends Cubit<ToggleInerestsStates> {
  ToggleInerestsCubit() : super(ToggleInerestsInitialState());

  List<String> selectedUserCategories = []; 

  List<String> get selectedCategories => selectedUserCategories;

  
  void toggleInterests(String id) {
    if (selectedUserCategories.contains(id)) {
      selectedUserCategories.remove(id);
    } else {
      selectedUserCategories.add(id);
    }
    emit(ToggledInerestsState(List.from(selectedUserCategories)));
  }
}