import 'package:flutter/material.dart';

class CardSettingCustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CardSettingCustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  _CardSettingCustomSwitch createState() => _CardSettingCustomSwitch();
}

class _CardSettingCustomSwitch extends State<CardSettingCustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> _circleAnimation;
  late AnimationController _animationController;
  late bool isActive = false;

  @override
  void initState() {
    super.initState();
    isActive = widget.value;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerLeft : Alignment.centerRight,
      end: widget.value ? Alignment.centerRight : Alignment.centerLeft,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    if (isActive) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CardSettingCustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        isActive = widget.value;
      });
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
        setState(() {
          isActive = !isActive;
        });
        widget.onChanged(isActive);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: 38.0,
            height: 22.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                  color: isActive ? Colors.blue : Colors.grey,
                  width: 1.0
              ),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? Colors.transparent
                  : Colors.transparent,
            ),
            child: Visibility(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                  alignment: _circleAnimation.value,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.white,
                      color: isActive ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
