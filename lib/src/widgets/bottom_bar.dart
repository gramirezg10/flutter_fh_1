import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:my_app/src/util/responsive.dart';

class BottomBarItem {
  final String iconName, label;
  final Widget content;

  BottomBarItem({@required this.iconName, @required this.label, @required this.content});
}

class BottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentPage;
  final void Function(int) onChanged;

  BottomBar({@required this.items, @required this.currentPage, this.onChanged}) :
    assert(items != null && items.length > 0),
    assert(currentPage != null && currentPage >= 0);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(responsive.dp(1)),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final bool isActive = index == currentPage;
            final BottomBarItem item = items[index];
            return Expanded(
              child: Container(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => onChanged(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        getIconUsingPrefix(name: item.iconName),
                        color: isActive ? Colors.blue : Colors.black38,
                      ),
                      Text(
                        item.label,
                        style: TextStyle(color: isActive ? Colors.blue : Colors.black38),
                      )
                    ],
                  )
                ),
              )
            );
            })
          )
        ),
    );
  }
}
