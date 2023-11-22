import 'package:flutter/material.dart';

class BottomSwitchesContainer extends StatelessWidget {
  final Function() onNext;
  final Function() onPrev;

  const BottomSwitchesContainer({Key? key, required this.onNext, required this.onPrev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: onPrev,
            child: Icon(
              Icons.arrow_left,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onNext,
            child: Icon(
              Icons.arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
