import 'package:flutter/material.dart';
import 'package:flutter_application_1/privacy_policy.dart';
import 'package:flutter_application_1/send_feedback.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/widget/sample_item.dart';

import 'contacts.dart';
import 'dashboard.dart';
import 'events.dart';
import 'my_drawer_header.dart';
import 'notes.dart';
import 'notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class RightMenu {
  String name;
  String text;

  RightMenu({required this.name, required this.text});
}

List<RightMenu> rightMenu = [
  RightMenu(name: "itemOne", text: "oke"),
  RightMenu(name: "itemTwo", text: "text")
];

class HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  var getId = 0;
  SampleItem? selectedMenu;
  MainMenu? selectedMainMenu;
  MasterData? selectedMasterData;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("Rapid Tech"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: getId == 1
                ? PopupMenuButton<SampleItem>(
                    key: popupButtonKey,
                    initialValue: selectedMenu,
                    onSelected: (SampleItem item) {
                      print("oke getId");
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (_) => menuEntries,
                  )
                : getId == 2
                    ? PopupMenuButton<MainMenu>(
                        key: popupButtonKey,
                        initialValue: selectedMainMenu,
                        onSelected: (MainMenu item) {
                          print("oke getId");
                          setState(() {
                            selectedMainMenu = item;
                          });
                        },
                        itemBuilder: (_) => mainMenu,
                      )
                    : PopupMenuButton<MasterData>(
                        key: popupButtonKey,
                        initialValue: selectedMasterData,
                        onSelected: (MasterData item) {
                          print("oke getId");
                          setState(() {
                            selectedMasterData = item;
                          });
                        },
                        itemBuilder: (_) => masterData,
                      ),

            // PopupMenuButton<String>(
            //   itemBuilder: (context) => rightMenu
            //       .map((item) => PopupMenuItem<String>(
            //             value: item.name,
            //             child: Text(
            //               item.text,
            //             ),
            //           ))
            //       .toList(),
            //     initialValue: rightMenu[0].name,
            //    onSelected: (item) {
            //     print("ffrg "+item);
            //      setState(() {

            //        selectedMenu = item;
            //     });

            //    },

            //   //  child: materialStatus ==null? Text("Select...",
            //   //    style: TextStyle(color:Colors.orange),)
            //   //    :Text(materialStatus,
            //   //    style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),)
            // ),

            // PopupMenuButton<SampleItem>(
            //   initialValue: selectedMenu,
            //   // Callback that sets the selected popup menu item.
            //   onSelected: (SampleItem item) {
            //     setState(() {
            //       selectedMenu = item;
            //     });
            //   },
            //   itemBuilder: (BuildContext context) =>
            //       <PopupMenuEntry<SampleItem>>[
            //     const PopupMenuItem<SampleItem>(
            //       value: SampleItem.itemOne,
            //       child: Text('Item 1'),
            //     ),
            //     const PopupMenuItem<SampleItem>(
            //       value: SampleItem.itemTwo,
            //       child: Text('Item 2'),
            //     ),
            //     const PopupMenuItem<SampleItem>(
            //       value: SampleItem.itemThree,
            //       child: Text('Item 3'),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              myDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            getId = id;
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
