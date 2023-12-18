import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              GetWeatherCubit weatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              weatherCubit.getWeather(value: value);
              Navigator.pop(context);
            },
            style: TextStyle(
              fontSize: 18,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(10, 32, 10, 32),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              hintText: 'Enter City Name',
              suffixIconColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
