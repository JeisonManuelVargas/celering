import 'package:flutter/material.dart';
import 'package:celering_user_app/core/util/debouncer.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:celering_user_app/core/widget/input_celering.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:celering_user_app/features/search_view/presentation/bloc/search_view_cubit.dart';
import 'package:celering_user_app/features/search_view/presentation/bloc/search_view_state.dart';
import 'package:celering_user_app/features/search_view/presentation/widgets/container_item_place.dart';

class SearchView extends BaseScreen<SearchViewState, SearchViewCubit> {
  final Function(PlaceModel) onTapPlace;
  final ScrollController scrollController;
  static final _debouncer = HandledDebouncer(milliseconds: 700);

  const SearchView({
    Key? key,
    required this.onTapPlace,
    required this.scrollController,
  }) : super(key: key);

  @override
  SearchViewCubit createBloc() => sl<SearchViewCubit>()..load();

  @override
  Widget buildScreen(
      BuildContext context, SearchViewCubit bloc, SearchViewState state) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: ScreenSize.height(context) * 0.05,
            left: ScreenSize.width(context) * 0.03,
            right: ScreenSize.width(context) * 0.03,
            bottom: ScreenSize.height(context) * 0.01,
          ),
          child: InputCelering(
            label: "Search",
            onChanged: (String text) => _debouncer.run(
              () => bloc.searchPlace(place: text),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: ScreenSize.width(context),
            height: ScreenSize.height(context) * 0.9,
            child: state.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: state.places.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ContainerItemPlace(
                      place: state.places[index],
                      handledTap: () => onTapPlace(state.places[index]),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
