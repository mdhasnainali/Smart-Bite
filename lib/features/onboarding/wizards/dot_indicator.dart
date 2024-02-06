import 'package:flutter/cupertino.dart';

import '../../../utils/constants/color.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 5,
      width: 15,
      decoration: BoxDecoration(
          color: isActive? SmartBiteColor.primary : SmartBiteColor.grey,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}