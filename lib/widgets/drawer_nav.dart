import 'package:flutter/material.dart';

import '/pages/home_page.dart';
import '/pages/inbox_page.dart';
import '/pages/system_page.dart';
import '/pages/ticket_page.dart';
import '/pages/validation_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.grey.shade500, width: .2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'DHIS2',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFF1D5288),
                    radius: 20,
                    child: Text(
                      'J',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _listTileWidget(
              context, 'Inbox', '2', Icons.inbox, () => const InboxPage()),
          _listTileWidget(context, 'Validation', '3', Icons.verified_sharp,
              () => const InboxPage()),
          _listTileWidget(
              context, 'Ticket', '5', Icons.scanner, () => const InboxPage()),
          _listTileWidget(context, 'System', '4', Icons.system_update,
              () => const InboxPage()),
        ],
      ),
    );
  }

  Widget _listTileWidget(
    BuildContext context,
    String title,
    String count,
    IconData icon,
    Widget Function() page,
  ) {
    return ListTile(
        title: Text(title),
        leading: Icon(icon),
        trailing: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              )),
          child: Text(
            "$count new",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page();
            },
          ));
        });
  }
}
