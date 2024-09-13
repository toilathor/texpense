import 'package:flutter/material.dart';
import 'package:texpense/gen/assets.gen.dart';

ValueNotifier<Offset> position = ValueNotifier(const Offset(0, 50));

class BubbleMenuWidget extends StatefulWidget {
  const BubbleMenuWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<BubbleMenuWidget> createState() => _BubbleMenuWidgetState();
}

class _BubbleMenuWidgetState extends State<BubbleMenuWidget> {
  ValueNotifier<bool> press = ValueNotifier(false);
  late Size sizeScreen = Size.zero;
  late EdgeInsets viewPadding = EdgeInsets.zero;
  final sizeBubble = 64.0;

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    viewPadding = MediaQuery.of(context).viewPadding;

    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: position,
            builder: (context, value, child) => AnimatedPositioned(
              top: value.dy,
              left: value.dx,
              curve: Curves.easeOut,
              duration: Duration(milliseconds: press.value ? 50 : 250),
              child: ValueListenableBuilder(
                valueListenable: press,
                builder: (context, value, _) => AnimatedScale(
                  duration: const Duration(milliseconds: 250),
                  scale: value ? 1.2 : 1,
                  child: child ?? const SizedBox.shrink(),
                ),
              ),
            ),
            child: Listener(
              onPointerMove: (event) {
                position.value =
                    event.position.translate(-sizeBubble / 2, -sizeBubble / 2);
              },
              onPointerDown: (event) {
                press.value = true;
              },
              onPointerUp: (event) {
                press.value = false;
                double dx = 0, dy = 0;
                if (event.position.dx > sizeScreen.width / 2) {
                  dx = sizeScreen.width - sizeBubble;
                }

                if (position.value.dy <= 0) {
                  dy = 0;
                } else if (position.value.dy >=
                    sizeScreen.height - sizeBubble * 2) {
                  dy = sizeScreen.height - sizeBubble * 2;
                } else {
                  dy = position.value.dy;
                }
                position.value = Offset(dx, dy);
              },
              child: GestureDetector(
                onTap: widget.onTap,
                child: Center(
                  child: Container(
                    height: sizeBubble,
                    width: sizeBubble,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: AppAssets.imagesLogoNoBackground.image(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
