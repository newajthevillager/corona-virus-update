import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_bloc.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_bloc.dart';
import 'package:corona_live/data/dataSource/corona_data_source.dart';
import 'package:corona_live/data/repositories/corona_repository.dart';
import 'package:corona_live/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final CoronaRepository coronaRepository = CoronaRepository(
    coronaDataSource: CoronaDataSource(),
  );
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Live',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CoronaBloc(
              coronaRepository: coronaRepository,
            ),
          ),
          BlocProvider(
            create: (context) => CoronaCountriesBloc(
              coronaRepository: coronaRepository,
            ),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
