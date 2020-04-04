import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_bloc.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_event.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_state.dart';
import 'package:corona_live/res/colors/app_colors.dart';
import 'package:corona_live/ui/widgets/app_widgets.dart';
import 'package:corona_live/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic/neumorphic.dart';

class CoronaSummaryPage extends StatefulWidget {
  @override
  _CoronaSummaryPageState createState() => _CoronaSummaryPageState();
}

class _CoronaSummaryPageState extends State<CoronaSummaryPage> {
  double scrHeight, scrWidth;

  CoronaBloc coronaBloc;

  @override
  void initState() {
    super.initState();
    coronaBloc = BlocProvider.of<CoronaBloc>(context);
    coronaBloc.add(FetchCoronaSummary());
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[850],
          height: scrHeight,
          child: BlocBuilder<CoronaBloc, CoronaSummaryState>(
            builder: (context, state) {
              if (state is CoronaSummaryInitial) {
                return buildLoadingUi();
              } else if(state is CoronaSummaryLoadingState) {
                return buildLoadingUi();
              } else if (state is CoronaSummaryLoaded) {
                return buildSuccessUi(state);
              } else if (state is CoronaSummaryFailure) {
                return buildErrorUi(state.message);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildSuccessUi(CoronaSummaryLoaded state) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
          alignment: Alignment.center,
          child: NeuText(
            "CORONA VIRUS SUMMARY",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 2.3,
              fontFamily: "RussoOne",
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
          alignment: Alignment.center,
          child: Text(
            Helper.millisecondsToDate(state.coronaSummary.updated),
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 4.5,
              fontFamily: "RussoOne",
            ),
          ),
        ),
        NeuCard(
          child: Text(
            "${state.coronaSummary.deaths}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: "RussoOne",
              letterSpacing: 2.5,
            ),
          ),
          alignment: Alignment.center,
          bevel: 25.0,
          decoration: NeumorphicDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[850],
          ),
          margin: EdgeInsets.only(top: 30.0),
          width: 150.0,
          height: 150.0,
          curveType: CurveType.concave,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 25.0),
          alignment: Alignment.center,
          child: NeuText(
            "TOTAL DEATH",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              
              fontSize: 25.0,
            ),
          ),
        ),
        //////
        Container(
          margin: EdgeInsets.only(top: 10.0),
          alignment: Alignment.center,
          child: Text(
            state.coronaSummary.cases.toString(),
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: "RussoOne",
              letterSpacing: 4.5,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30.0),
          alignment: Alignment.center,
          child: NeuText(
            "TOTAL CASE",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),

        //
        Container(
          margin: EdgeInsets.only(top: 10.0),
          alignment: Alignment.center,
          child: Text(
            state.coronaSummary.recovered.toString(),
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: "RussoOne",
              letterSpacing: 4.5,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: NeuText(
            "TOTAL RECOVERED",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}
