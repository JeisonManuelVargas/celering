import 'package:celering_user_app/navigator.dart';
import 'package:flutter/material.dart';
import 'package:celering_user_app/core/util/debouncer.dart';
import 'package:celering_user_app/injection_container.dart';
import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:celering_user_app/core/helpers/base_screen_stateless.dart';
import 'package:celering_user_app/features/search_view/presentation/bloc/search_view_cubit.dart';
import 'package:celering_user_app/features/search_view/presentation/bloc/search_view_state.dart';
import 'package:celering_user_app/features/search_view/presentation/widgets/container_item_place.dart';

class SearchView extends BaseScreen<SearchViewState, SearchViewCubit> {
  static final _debouncer = HandledDebouncer(milliseconds: 700);

  const SearchView({Key? key}) : super(key: key);

  @override
  SearchViewCubit createBloc() => sl<SearchViewCubit>()..load();

  @override
  Widget buildScreen(
      BuildContext context, SearchViewCubit bloc, SearchViewState state) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (String text) => _debouncer.run(
            () => bloc.searchPlace(place: text),
          ),
        ),
      ),
      body: SizedBox(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context) * 0.9,
        child: state.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: state.places.length,
                itemBuilder: (BuildContext context, int index) =>
                    ContainerItemPlace(
                  place: state.places[index],
                  handledTap: () => AppNavigator.pushNamedAndRemoveUntil(
                    Routes.HOME,
                    arguments: state.places[index],
                  ),
                ),
              ),
      ),
    );
  }
}
