import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test/business_logic/home_cubit.dart';
import 'package:map_test/constants.dart';

class MapProvider extends StatelessWidget {
  const MapProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final mapCubit = HomeCubit.get(context);
        final size = MediaQuery.of(context).size;
        return Container(
          height: size.height*0.5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              FlutterMap(
                mapController: mapCubit.mapController,
                options: MapOptions(
                    center: LatLng(45.5231, -122.6765),
                    zoom: 13,
                    onTap: (pos, LatLng location) {
                      mapCubit.getTabbedMarker(location);
                      log('tapped: $location');
                    }),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=$apiKey',
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: mapCubit.markers,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height*0.012, right: size.height*0.012),
                child: FloatingActionButton(
                  heroTag: 'MAP_MY_LOCATION',
                  onPressed: () => mapCubit.getCurrentLocation(),
                  child: Icon(Icons.my_location, size: size.height*.03),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
