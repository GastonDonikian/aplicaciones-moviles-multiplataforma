//ONLY FOR TESTING PURPOSE, will be deleted later
import 'package:flutter/material.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';

class ApplyTab extends StatelessWidget {
  ApplyTab({super.key, required this.counterFunction, required this.counter});

  void Function()? counterFunction;
  int counter;

  // onPressedShowModal(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: ((BuildContext context) {
  //       return SerManosModal(
  //           title: "Un Techo para mi Pais",
  //           schedule: "Días sábados de 9.00 a 17.00 horas.",
  //           location: "Caballito");
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SerManosGridPadding(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SerManosVolunteerCard(
                imagePath: 'assets/volunteer_card_1.png',
                cardOverlineText: 'Accion Social',
                cardTitle: 'Un Techo Para mi Pais',
                onPressedFav: () => {},
                onPressedLocation: () => {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SerManosNewsCard(
                imagePath: 'assets/news_card_1.png',
                cardOverlineText: 'Reporte 2820',
                cardTitle: 'Ser Donante Voluntario',
                cardText:
                    'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre',
                onPressed: () => {},
              ),
            ),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // const CustomInput(
            //     placeholder: 'Placeholder',
            //     label: 'Label',
            //     errorText: 'ErrorText',
            //     errorIcon: SerManosIcons.errorIcon,
            //     eraseIcon: SerManosIcons.closeIcon,
            //     defaultIcon: SerManosIcons.searchIcon),
            // SerManosIconTextButton(
            //     label: "Press me",
            //     buttonIcon: SerManosIcons.addIcon,
            //     onPressed: counterFunction),
            // SerManosTextButton(
            //     label: "And press me too", onPressed: counterFunction),
            // SerManosElevatedButton(
            //     label: "Press me to activate modal",
            //     onPressed: () => onPressedShowModal(context)),
          ],
        ),
      ),
    );
  }
}
