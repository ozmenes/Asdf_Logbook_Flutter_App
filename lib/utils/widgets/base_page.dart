import 'package:asdf_logbook/pages/drive/drive_page.dart';
import 'package:asdf_logbook/utils/components/custom_bottom_app_bar.dart';
import 'package:asdf_logbook/utils/components/custom_drawer.dart';
import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.headerTitleText}) : super(key: key);
  final String headerTitleText;
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  buildPageUI() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: buildAppBar(widget.headerTitleText),
      ),
      body: SafeArea(
        child: buildPageUI(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (builder) => const DrivePage())),
        tooltip: 'Drive',
        // backgroundColor: blueColor,
        child: const Icon(Icons.drive_eta),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
      endDrawer: const CustomDrawer(),
    );
  }

  Widget buildAppBar(String headerTitleText) {
    return AppBar(
      elevation: 0,
      title: Text(
        headerTitleText, //AppLocalizations.of(context)!.appHeader
        style: const TextStyle(
          fontSize: 20,
          //color: blackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: IconButton(
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(Icons.menu)),
        )
      ],
    );
  }
}
