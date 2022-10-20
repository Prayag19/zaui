
import 'package:flutter/material.dart';
import 'package:za_ui/constants/extensions.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';

class ExpandTile extends StatefulWidget {
  const ExpandTile({
    Key? key,
    required this.extItems,
    required this.extName
  }) : super(key: key);

  final String extName;
  final String extItems;


  @override
  State<ExpandTile> createState() => _ExpandTileState();
}

class _ExpandTileState extends State<ExpandTile> {

  bool isExpanded =false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
            title: SizedBox(
              height: context.responsive(50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text( widget.extName,
          style: TextStyle(color: ckPrimaryActionColor, fontSize: context.responsive(14, ), fontWeight: FontWeight.bold),
        ),
              ),
            ),
          trailing: Icon(  isExpanded?ickDetailsCollapse:ickDetailsExpand, size:context.responsive(20,), color: ckPrimaryActionColor, ),
   //   subtitle: Container(width: getWidth(context), height: 1, color: Colors.black12,),
            onExpansionChanged: (value){
          isExpanded=value;
          setState(() {});
          },
          children: List.generate(1, (index) {
            return ListTile(
              leading: Text(widget.extItems),
            );
          })




        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(width: getWidth(context), height: 1, color: Colors.black12,),
        )
      ],
    );
  }
}