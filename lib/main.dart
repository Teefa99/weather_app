import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (BuildContext context) =>
            BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            theme: ThemeData(
              primarySwatch: getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition),
            ),
            home: HomeView(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == "Sunny" ||
      condition == "Partly cloudy" ||
      condition == "Patchy light rain" ||
      condition == "Light rain") {
    return Colors.orange;
  } else if (condition == "Cloudy" ||
      condition == "Overcast" ||
      condition == "Mist" ||
      condition == "Fog" ||
      condition == "Freezing fog" ||
      condition == "Patchy light drizzle" ||
      condition == "Light drizzle" ||
      condition == "Patchy light rain" ||
      condition == "Light rain" ||
      condition == "Patchy light snow" ||
      condition == "Light snow" ||
      condition == "Patchy moderate snow" ||
      condition == "Moderate snow" ||
      condition == "Patchy heavy snow" ||
      condition == "Heavy snow" ||
      condition == "Ice pellets" ||
      condition == "Light rain shower" ||
      condition == "Moderate or heavy rain shower" ||
      condition == "Torrential rain shower" ||
      condition == "Light sleet showers" ||
      condition == "Moderate or heavy sleet showers" ||
      condition == "Light snow showers" ||
      condition == "Moderate or heavy snow showers" ||
      condition == "Light showers of ice pellets" ||
      condition == "Moderate or heavy showers of ice pellets" ||
      condition == "Patchy light rain with thunder" ||
      condition == "Moderate or heavy rain with thunder" ||
      condition == "Patchy light snow with thunder" ||
      condition == "Moderate or heavy snow with thunder") {
    return Colors.grey;
  } else if (condition == "Patchy rain possible" ||
      condition == "Patchy snow possible" ||
      condition == "Patchy sleet possible" ||
      condition == "Patchy freezing drizzle possible" ||
      condition == "Patchy light drizzle" ||
      condition == "Moderate rain at times" ||
      condition == "Moderate rain" ||
      condition == "Heavy rain at times" ||
      condition == "Heavy rain" ||
      condition == "Light freezing rain" ||
      condition == "Moderate or heavy freezing rain" ||
      condition == "Light sleet" ||
      condition == "Moderate or heavy sleet") {
    return Colors.blue;
  } else if (condition == "Thundery outbreaks possible") {
    return Colors.blueGrey;
  } else {
    return Colors.teal;
  }
}
