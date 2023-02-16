
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_test/business_logic/home_cubit.dart';
import 'package:map_test/presentation/widgets/address_card.dart';
import 'package:map_test/presentation/widgets/map_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentLocation(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Map'),
        ),
        body: SafeArea(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: MapProvider()
              ),
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: AddressCard()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
