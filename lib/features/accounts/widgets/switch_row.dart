import 'package:flutter/material.dart';

class SwitchRow extends StatefulWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const SwitchRow({super.key, required this.title, required this.value, this.onChanged});

  @override
  State<SwitchRow> createState() => _SwitchRowState();
}

class _SwitchRowState extends State<SwitchRow> {
  late bool _value = widget.value;

  void _toggle(bool v) {
    setState(() => _value = v);
    widget.onChanged?.call(v);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          _IOSwitchSize(
            width: 48,
            height: 28,
            thumb: 20,
            child: _IOSwitch(
              value: _value,
              onChanged: _toggle,
            ),
          ),
        ],
      ),
    );
  }
}

class _IOSwitchSize extends InheritedWidget {
  final double width;
  final double height;
  final double thumb;

  const _IOSwitchSize({required this.width, required this.height, required this.thumb, required super.child});

  static _IOSwitchSize of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<_IOSwitchSize>()!;

  @override
  bool updateShouldNotify(_IOSwitchSize oldWidget) => width != oldWidget.width || height != oldWidget.height || thumb != oldWidget.thumb;
}

class _IOSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _IOSwitch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final s = _IOSwitchSize.of(context);
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: s.width,
        height: s.height,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: value ? const Color(0xFF34C759) : const Color(0xFFE4E8EC),
          borderRadius: BorderRadius.circular(s.height / 2),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            width: s.thumb,
            height: s.thumb,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Color(0x33000000), blurRadius: 2, offset: Offset(0, 1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


