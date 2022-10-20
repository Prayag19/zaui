
import 'package:flutter/material.dart';
import 'package:za_ui/constants/extensions.dart';

import '../../constants/app_colors.dart';

class DropDownList extends StatefulWidget {
  DropDownList({Key? key,
    required this.bLabel,
    required this.items,
    required this.sendOptionUp


  }) : super(key: key);

  final String bLabel;
  final List<String> items;
  Function sendOptionUp;


  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {

  // Initial Selected Value

  String dropdownvalue  ="";

List<String> itemsList =[];


  @override
  void initState() {
    itemsList.add(widget.bLabel);
    itemsList.addAll(widget.items);
     dropdownvalue =  itemsList.first;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         DropdownButton(
          elevation: 0,
          underline: Container(),
          alignment: Alignment.center,
          value: dropdownvalue,
          hint: const Center(child: Text("Select Color")),


           icon: const Padding(
               padding: EdgeInsets.only(left:20),
               child:Icon(Icons.keyboard_arrow_down)
           ),
           selectedItemBuilder: (BuildContext context) {
            return itemsList.map((String value) {
              return Center(
                child: Row(
                  children: [
                    Text( dropdownvalue == widget.bLabel?dropdownvalue: widget.bLabel.split(" ").last,
                      style: TextStyle(color: ckPrimaryMaterialColor.shade200, fontWeight: FontWeight.w600, fontSize: context.responsive(14)),
                    ),
                    SizedBox(width: context.responsive(10,axis: Axis.horizontal),),
                    Text(
                      dropdownvalue == widget.bLabel?"":dropdownvalue,
                    style: TextStyle(color: ckPrimaryMaterialColor.shade200, fontWeight: FontWeight.w600, fontSize: context.responsive(14)),
                    ),
                  ],
                ),
              );
            }).toList();
          },

          items: itemsList.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),

          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              widget.sendOptionUp(dropdownvalue);
            });
          },
        ),
      ],
    );
  }
}
