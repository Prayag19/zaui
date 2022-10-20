
import 'package:flutter/material.dart';
import 'package:za_ui/constants/extensions.dart';

import '../../constants/app_colors.dart';

class LongAppButton extends StatelessWidget {
  LongAppButton({
    Key? key,
    required this.bLabel,
    required this.onPress,
    required this.icData,
    this.icColor =ckPrimaryActionColorLight,
  }) : super(key: key);

  final String bLabel;
  final IconData icData;
  final Color icColor;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: context.responsive(40),
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: ()=>onPress(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icData, color:icColor, size: context.responsive(20),),
            const SizedBox(width: 5,),
            Text(bLabel, style: TextStyle(color: ckPrimaryMaterialColor.shade200, fontWeight: FontWeight.w600, fontSize: context.responsive(12)),),
          ],
        ),
      ),
    );
  }
}
