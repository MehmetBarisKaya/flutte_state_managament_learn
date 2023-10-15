import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:state_managament_in_life/feature/travel/cubit/travel_cubit.dart';
import 'package:state_managament_in_life/feature/travel/model/travel_model.dart';
import 'package:state_managament_in_life/product/padding/page_padding.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final data = 'See all';
  final data2 = 'Popular destinations near you';
  final data3 = 'Hey John! \n Where do you want to go today?';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelCubit>(
      create: (context) => TravelCubit()..fetchItems(),
      child: BlocConsumer<TravelCubit, TravelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: PagePadding.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data3,
                    style: context.general.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    onChanged: (value) {
                      context.read<TravelCubit>().searchByItems(value);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder()),
                  ),
                  context.sized.emptySizedHeightBoxLow,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data2,
                        style: context.general.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<TravelCubit>().seeAllItems();
                        },
                        child: Text(
                          data,
                          style: context.general.textTheme.titleMedium
                              ?.copyWith(
                                  color: context.general.colorScheme.error),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.26),
                    child: _itemsCast(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (state is TravelItemsSeeAll)
                          ? state.images.length
                          : 0,
                      itemBuilder: (BuildContext context, int index) {
                        final image =
                            (state as TravelItemsSeeAll).images[index];
                        return Image.asset(image);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemsCast(BuildContext context) {
    return BlocSelector<TravelCubit, TravelState, List<TravelModel>>(
      selector: (state) {
        return (state is TravelItemsLoaded)
            ? state.items
            : context.read<TravelCubit>().allItems;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                width: context.sized.dynamicWidth(0.37),
                child: Image.asset(TravelModel.mockItems[index].imagePath),
              ),
            );
          },
        );
      },
    );
  }
}
