import 'package:flutter/material.dart';
import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:celering_user_app/features/search_view/data/models/place_model.dart';

class ContainerItemPlace extends StatelessWidget {
  final PlaceModel place;
  final Function handledTap;

  const ContainerItemPlace({
    Key? key,
    required this.place,
    required this.handledTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenSize.height(context) * 0.02,
        horizontal: ScreenSize.width(context) * 0.05,
      ),
      child: Material(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => handledTap(),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize.height(context) * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenSize.width(context) * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(place.title),
                      SizedBox(
                        height: ScreenSize.height(context) * 0.01,
                      ),
                      Text(
                        "${place.address.county}/${place.address.countryName}",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${place.position.lat}/${place.position.lng}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
