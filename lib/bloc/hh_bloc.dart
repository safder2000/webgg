import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gg/fetch.dart';
import 'package:gg/model.dart';
import 'package:meta/meta.dart';

part 'hh_event.dart';
part 'hh_state.dart';

class HhBloc extends Bloc<HhEvent, HhState> {
  HhBloc() : super(InitialState()) {
    on<HhEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FecthData>((event, emit) async {
      mList data = await fetch();
      log(data.toString());

      emit(
        HhState(
          itemList: mList(sName: data.sName),
        ),
      );
    });
  }
}
