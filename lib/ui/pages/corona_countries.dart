import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_bloc.dart';
import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_event.dart';
import 'package:corona_live/blocs/coronaCountriesBloc/corona_countries_state.dart';
import 'package:corona_live/data/models/corona_country.dart';
import 'package:corona_live/res/colors/app_colors.dart';
import 'package:corona_live/ui/pages/corona_country_details_page.dart';
import 'package:corona_live/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaCountries extends StatefulWidget {
  @override
  _CoronaCountriesState createState() => _CoronaCountriesState();
}

class _CoronaCountriesState extends State<CoronaCountries> {
  double scrHeight, scrWidth;
  CoronaCountriesBloc coronaCountriesBloc;

  bool isSearching = false;
  List<CoronaCountry> list = []; // for filtering
  TextEditingController searchTextCntrlr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coronaCountriesBloc = BlocProvider.of<CoronaCountriesBloc>(context);
    coronaCountriesBloc.add(FetchCoronaCountries());
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: !isSearching
            ? Text(
                "CORONA VIRUS",
                style: TextStyle(
                    fontFamily: "RussoOne",
                    letterSpacing: 1.7,
                    color: Colors.teal),
              )
            : TextField(
                controller: searchTextCntrlr,
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: "Search by Country",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  coronaCountriesBloc.add(FilterCountry(
                    text: value,
                    countries: list
                  ));
                },
              ),
        centerTitle: true,
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    coronaCountriesBloc.add(CrossBtnPressed());
                    setState(() {
                      searchTextCntrlr.text = "";
                      isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.darkBg,
          height: scrHeight,
          child: BlocBuilder<CoronaCountriesBloc, CoronaCountriesState>(
            builder: (context, state) {
              print("State is : ${state.toString()}");
              if (state is CoronaCountriesLoading) {
                return buildLoadingUi();
              } else if (state is CoronaCountriesLoaded) {
                List<CoronaCountry> countries = state.countries;
                list = countries;
                return buildCoronaCountriesList(countries);
              } else if (state is CoronaCountriesLoadFailure) {
                return buildErrorUi(state.message);
              } else if (state is FilteredCountries) {
                print("Yielded : ${state.toString()}");
                return buildCoronaCountriesList(state.countries);
              } else if (state is NoCountryFound) {
                return buildErrorUi("No Country Found");
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildCoronaCountriesList(List<CoronaCountry> countries) {
    return Container(
      margin: EdgeInsets.only(bottom: 118.0),
      child: ListView.builder(
        padding: EdgeInsets.all(5.0),
        shrinkWrap: true,
        itemCount: countries.length,
        itemBuilder: (context, position) {
          CoronaCountry coronaCountry = countries[position];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                navigateTodetailsPage(context, coronaCountry);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                child: Material(
                  elevation: 10.0,
                  shadowColor: Colors.grey,
                  color: AppColors.upDark,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // name
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            coronaCountry.country.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.countryNameColor,
                              fontSize: 20.0,
                              fontFamily: "RussoOne",
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        // cases
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Cases : ${coronaCountry.cases.toString()}",
                            style: TextStyle(
                              color: AppColors.casesColor,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // deaths
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: RichText(
                                text: TextSpan(
                                    text: 'Deaths : ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: coronaCountry.deaths.toString(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "RussoOne",
                                          color: AppColors.deathsColor,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            // today deaths
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: RichText(
                                text: TextSpan(
                                    text: 'Today : ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: coronaCountry.todayDeaths
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "RussoOne",
                                          color: coronaCountry.todayDeaths == 0
                                              ? AppColors.todayNoDeathColor
                                              : AppColors.todayDeathsColor,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateTodetailsPage(BuildContext context, CoronaCountry country) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return CoronaCountryDetailsPage(country: country);
    }));
  }
}
