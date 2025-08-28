import 'package:flutter/material.dart';
import '../../../core/widgets/custom_switch.dart';
import '../../../core/typography/text_15_regular.dart';

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
          Text15Regular(text: widget.title, color: Colors.black),
          CustomSwitch(
            value: _value,
            onChanged: _toggle,
          ),
        ],
      ),
    );
  }
}
