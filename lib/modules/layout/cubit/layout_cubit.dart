import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  var selectedIndex = 0;
  void changeIndex(index, context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed('home');
        break;
      case 1:
        GoRouter.of(context).goNamed('library');
        break;
    }

    selectedIndex = index;
    emit(BNBChangeState());
  }
}
