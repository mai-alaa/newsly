sealed class ToggleInerestsStates {}

class ToggleInerestsInitialState extends ToggleInerestsStates {
  final List<String> selectedCategories;

  ToggleInerestsInitialState({this.selectedCategories = const []});
}

class ToggledInerestsState extends ToggleInerestsStates {
  final List<String> selectedCategories;

  ToggledInerestsState(this.selectedCategories);
}