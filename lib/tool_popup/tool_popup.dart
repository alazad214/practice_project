import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class TooltipPopupScreen extends StatefulWidget {
  const TooltipPopupScreen({
    super.key,
  });
  @override
  State createState() => _TooltipPopupScreenState();
}

class _TooltipPopupScreenState extends State<TooltipPopupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: TargetWidget(),
        ),
      ),
    );
  }
}

class TargetWidget extends StatefulWidget {
  const TargetWidget({Key? key}) : super(key: key);

  @override
  State createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  final _controller = SuperTooltipController();
  Future<bool>? _willPopCallback() async {
    if (_controller.isVisible) {
      await _controller.hideTooltip();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _willPopCallback,
      child: GestureDetector(
        onTap: () async {
          await _controller.showTooltip();
        },
        child: SuperTooltip(
          controller: _controller,
          popupDirection: TooltipDirection.up,
          backgroundColor: Color(0xff2f2d2f),
          showCloseButton: true,
          left: 30,
          right: 30,
          bottom: 200,
          arrowTipDistance: 20.0,
          minimumOutsideMargin: 120,
          arrowBaseWidth: 20.0,
          arrowLength: 20.0,
          borderWidth: 2.0,
          constraints: const BoxConstraints(
            minHeight: 0.0,
            maxHeight: 100,
            minWidth: 0.0,
            maxWidth: 100,
          ),
          touchThroughAreaShape: ClipAreaShape.rectangle,
          touchThroughAreaCornerRadius: 30,
          barrierColor: Color.fromARGB(26, 47, 45, 47),
          content: const Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
