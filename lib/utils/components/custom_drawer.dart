import 'package:asdf_logbook/utils/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ionicons/ionicons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Drawer(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    color: isDarkMode ? blueColor : darkBlueColor,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/warehouse-white.png"),
                        fit: BoxFit.scaleDown,
                        scale: 5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Username",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Divider(
                    height: 20,
                    color: blackColor,
                    thickness: 1,
                    endIndent: 15,
                    indent: 15,
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.person),
                    title: const Text("Profile"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.car),
                    title: const Text("Vehicles"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Container()
                              //VehiclePage()
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.book),
                    title: const Text("Logbook"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Divider(
                    height: 20,
                    color: blackColor,
                    thickness: 1,
                    endIndent: 15,
                    indent: 15,
                  ),
                  ListTile(
                    leading: const Icon(Icons.feedback),
                    title: const Text("Feedback"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sunny)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container()//LanguagePicker(),
                    ),
                  ],
                ),
                //Logout
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                  child: MaterialButton(
                    onPressed: () {
                      //_userService.signOut(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) =>  Container()//WelcomePage()
                          ));
                    },
                    height: 42,
                    minWidth: MediaQuery.of(context).size.width * 0.85,
                    color: blackColor,
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
