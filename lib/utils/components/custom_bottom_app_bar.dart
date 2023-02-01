import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias, //Clip.antiAliasWithSaveLayer,
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: ColoredBox(
        color: blackColor,
        child: IconTheme(
          data: const IconThemeData(
            color: lightGreyColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  tooltip: 'Home',
                  icon: const Icon(Icons.home),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Container())),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: IconButton(
                    tooltip: 'Logbook',
                    icon: const Icon(Icons.dashboard),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => Container())),
                  ),
                ),
                //if (centerLocations.contains(fabLocation)) const Spacer(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    tooltip: 'Licence',
                    icon: const Icon(Ionicons.ticket),
                    onPressed: () => Container()//myBottomSheet(context),
                  ),
                ),
                IconButton(
                  tooltip: 'Settings',
                  icon: const Icon(Icons.settings),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Container())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
