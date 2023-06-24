import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final NavigationBottomBarItems navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}

enum NavigationBottomBarItems {
  PROFILE,
  SEARCH,
  LIBRARY,
}