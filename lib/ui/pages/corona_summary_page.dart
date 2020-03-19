import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_bloc.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_event.dart';
import 'package:corona_live/blocs/coronaSummaryBloc/corona_summary_state.dart';
import 'package:corona_live/res/colors/app_colors.dart';
import 'package:corona_live/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic/neumorphic.dart';

class CoronaSummaryPage extends StatefulWidget {
  @override
  _CoronaSummaryPageState createState() => _CoronaSummaryPageState();
}

class _CoronaSummaryPageState extends State<CoronaSummaryPage> {
  CoronaSummaryBloc coronaSummaryBloc;
  double scrHeight, scrWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coronaSummaryBloc = BlocProvider.of<CoronaSummaryBloc>(context);
    coronaSummaryBloc.add(FetchCoronaSummary());
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.darkBg,
          height: scrHeight,
          child: BlocBuilder<CoronaSummaryBloc, CoronaSummaryState>(
            builder: (context, coronaSummaryState) {
              if (coronaSummaryState is CoronaSummaryInitial) {
                return buildLoadingUi();
              } else if (coronaSummaryState is CoronaSummaryLoading) {
                return buildLoadingUi();
              } else if (coronaSummaryState is CoronaSummaryLoaded) {
                return buildSuccessUi(coronaSummaryState);
              } else if (coronaSummaryState is CoronaSummaryLoadFailure) {
                return buildErrorUi(coronaSummaryState.message);
              }
            },
          ),
        ),
      ),
    );
  }

  // success ui
  Widget buildSuccessUi(CoronaSummaryLoaded state) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 25.0,bottom: 15.0),
          alignment: Alignment.center,
          child: Text(
            "CORONA VIRUS SUMMARY",
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 2.3,
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
              letterSpacing: 2.0,
            ),
          ),
          alignment: Alignment.center,
          bevel: 5.0,
          decoration: NeumorphicDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[900],
          ),
          margin: EdgeInsets.only(top: 30.0),
          width: 180.0,
          height: 180.0,
          curveType: CurveType.concave,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 25.0),
          alignment: Alignment.center,
          child: Text(
            "TOTAL DEATH",
            style: TextStyle(
              color: Colors.red[900],
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
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30.0),
          alignment: Alignment.center,
          child: Text(
            "TOTAL CASE",
            style: TextStyle(
              color: Colors.cyan,
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
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "TOTAL RECOVERED",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}
