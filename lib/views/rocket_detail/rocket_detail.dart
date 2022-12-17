import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/rocket_detail/widgets/info_widget.dart';
import 'package:flutter_spacex/widgets/default_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RocketDetail extends StatelessWidget {
  final RocketModel rocket;
  const RocketDetail({required this.rocket, super.key});

  List<String> getPayloads() {
    List<String> payloads = [];
    for (var payload in rocket.payloadWeights) {
      payloads.add('${payload.name}:\n${payload.kg}KG');
    }
    return payloads;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double colWidth = screenWidth * .25;
    return Scaffold(
        appBar: DefaultAppBar(
            title: rocket.name, backFunc: () => GoRouter.of(context).pop()),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(child: Image.asset('assets/images/rocket.png')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InfoWidget(
                    columnWidth: colWidth,
                    headerText: 'Payloads',
                    infoTexts: [...getPayloads()],
                    position: InfoPosition.right),
                InfoWidget(
                    columnWidth: colWidth,
                    headerText: 'Size',
                    infoTexts: [
                      'Height:\n${rocket.height.meters}M',
                      'Diameter:\n${rocket.diameter.meters}M',
                      'Mass:\n${rocket.mass.kg}KG'
                    ],
                    position: InfoPosition.left),
                InfoWidget(
                    columnWidth: colWidth,
                    headerText: 'General',
                    infoTexts: [
                      'Cost per launch:\n\$${rocket.costPerLaunch}',
                      'Success rate:\n${rocket.successRatePct}%',
                      'First Flight:\n${DateFormat('dd/MM/yyyy').format(rocket.firstFlight)}',
                    ],
                    position: InfoPosition.right),
                InfoWidget(
                    columnWidth: colWidth,
                    headerText: 'Engines',
                    infoTexts: [
                      'Type: ${rocket.engines.type}',
                      'Propellant 1:\n${rocket.engines.propellant1}',
                      'Propellant 2:\n${rocket.engines.propellant2}',
                    ],
                    position: InfoPosition.left),
              ],
            ),
          )
        ]));
  }
}
