part of 'hh_bloc.dart';

@immutable
class HhState {
  HhState({required this.itemList});

  mList itemList;
}

class InitialState extends HhState {
  InitialState()
      : super(
          itemList: mList(sId: 'idgg', sName: 'namegg'),
        );
}
