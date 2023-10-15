// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_managament_in_life/feature/travel/model/travel_model.dart';

import '../../../product/enum/image_enum.dart';

class TravelCubit extends Cubit<TravelState> {
  TravelCubit() : super(TravelLoading());
  List<TravelModel> allItems = [];

  Future<void> fetchItems() async {
    await Future.delayed(Duration(seconds: 2));
    allItems = TravelModel.mockItems;
    emit(TravelItemsLoaded(allItems));
  }

  void searchByItems(String data) {
    final result =
        allItems.where((element) => element.title.contains(data)).toList();
    emit(TravelItemsLoaded(result));
  }

  void seeAllItems() {
    emit(TravelItemsSeeAll([
      ImageEnums.camp_alt.toPathFeed,
      ImageEnums.camp_alt2.toPathFeed,
    ]));
  }
}

abstract class TravelState {}

class TravelLoading extends TravelState {}

class TravelItemsLoaded extends TravelState {
  final List<TravelModel> items;

  TravelItemsLoaded(this.items);
}

class TravelItemsSeeAll extends TravelState {
  final List<String> images;

  TravelItemsSeeAll(
    this.images,
  );
}
