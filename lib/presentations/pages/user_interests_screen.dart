import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newslt/config/routes.dart';
import 'package:newslt/core/extentions/int_extentions.dart';
import 'package:newslt/core/utils/cache_helper.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/presentations/cubits/toggle_inerests/toggle_inerests_cubit.dart';
import 'package:newslt/presentations/cubits/toggle_inerests/toggle_inerests_state.dart';
import 'package:newslt/presentations/widgets/category_card.dart';
import 'package:newslt/presentations/widgets/custom_button.dart';
import 'package:newslt/presentations/widgets/custom_grid_view.dart';
import 'package:newslt/presentations/widgets/headline_txt.dart';
import 'package:newslt/presentations/widgets/subtitle_txt.dart';
import 'package:newslt/presentations/widgets/user_interests_view_model.dart';

class UserInterestsScreen extends StatelessWidget {
  
  const UserInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 HeadlineText(text: 'Choose Your Interests'),
                 5.toHeight,
                 const SubTitle(text: 'Select Categories you are interested in'),
                 20.toHeight,
                 BlocBuilder<ToggleInerestsCubit,ToggleInerestsStates>(
                  builder: (context,state){
                    ToggleInerestsCubit toggleCubit = BlocProvider.of<ToggleInerestsCubit>(context);
                    List<String> selectedCategories = [];
                      if (state is ToggleInerestsInitialState) {
                        selectedCategories = state.selectedCategories;
                      } else if (state is ToggledInerestsState) {
                        selectedCategories = state.selectedCategories;
                      }
                    return CustomGridView(itemCount: categories.length, crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.2, itemBuilder: (context, index)=>CategoryCard(onTap: (){
                      toggleCubit.toggleInterests(categories[index].id);
                      
                    }, isSelected: selectedCategories.contains(categories[index].id), categoryColor: categories[index].color, categoryBorderColor: categories[index].borderColor, categoryTextColor: categories[index].textColor, categoryName: categories[index].name));
                  }
                  ),
                 20.toHeight,
                 CustomButton(onTap: (){
                  final toggleCubit = BlocProvider.of<ToggleInerestsCubit>(context);
                    CacheHelper.saveData(
                      key: 'selected_interests',
                      value: toggleCubit.selectedCategories,
                    );
                  context.go(AppRouter.verifyEmailScreen);
                 }, text: 'Continue', buttonColor: kPrimaryColor, txtColor: Colors.white)
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}