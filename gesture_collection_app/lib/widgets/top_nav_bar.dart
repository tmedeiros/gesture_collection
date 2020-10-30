import 'package:flutter/material.dart';

class TopNavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const TopNavBarWidget({
    Key key,
    @required this.height,
    @required this.title,
    }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  IconData getIcon(String pagename)
  {
    if (pagename == "main") {
      return Icons.ac_unit;
    }
    else {
      return Icons.accessibility;
    }
  }

  BackButton getLeading(bool navEnabled)
  {
    if (navEnabled) {
      return BackButton(
          color: Colors.blue,
          onPressed: null);
    }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:[
        Container(
          color: Colors.grey[300],
          child: AppBar(
            leading: getLeading(true),
            title: Center(
              child: Text(
                //_pages[_selectedPageIndex]['title'],
                this.title,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 32.0),
              ),
            ),
            actions:[
              IconButton(
                  icon: Icon(
                    getIcon("test"),
                    color: Colors.blue,
                    size: 36.0),
                  onPressed: null)
              ],
            ),
        ),
      ],
    );
  }
}