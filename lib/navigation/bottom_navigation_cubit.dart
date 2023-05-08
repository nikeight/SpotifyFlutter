import 'package:bloc/bloc.dart';
import 'package:praxis_flutter/navigation/NavigationState.dart';

class BottomNavigationCubit extends Cubit<NavigationState> {
  BottomNavigationCubit()
      : super(const NavigationState(NavigationBottomBarItems.PROFILE, 0));

  void getNavBarItem(NavigationBottomBarItems navbarItem) {
    switch (navbarItem) {
      case NavigationBottomBarItems.PROFILE:
        emit(const NavigationState(NavigationBottomBarItems.PROFILE, 0));
        break;
      case NavigationBottomBarItems.SEARCH:
        emit(const NavigationState(NavigationBottomBarItems.SEARCH, 1));
        break;
      case NavigationBottomBarItems.LIBRARY:
        emit(const NavigationState(NavigationBottomBarItems.LIBRARY, 2));
        break;
    }
  }
}
