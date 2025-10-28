import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/appcolors.dart';

class AccountSelectionCard extends StatelessWidget {
  final Map<String, dynamic> account;
  final bool isSelected;
  final bool isLast;
  final VoidCallback onTap;

  const AccountSelectionCard({
    super.key,
    required this.account,
    required this.isSelected,
    required this.isLast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Account icon
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: account['backgroundColor'],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: account['icon'] == 'iis'
                          ? SvgPicture.asset(
                              'assets/icons/individual-invest.account.colored.24.svg',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            )
                          : SvgPicture.asset(
                              'assets/icons/wallet.24.svg',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                account['iconColor'],
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  // Account info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Balance
                        Row(
                          children: [
                            Text(
                              account['balance'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF303441),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              account['change'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: account['changeType'] == 'positive'
                                    ? Colors.green
                                    : account['changeType'] == 'negative'
                                        ? Colors.red
                                        : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        
                        // Account details
                        Text(
                          '${account['id']} • ${account['name']}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5E6472),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  
                  // Selection indicator
                  AnimatedScale(
                    scale: isSelected ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: AnimatedOpacity(
                      opacity: isSelected ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/check.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Divider between items (except for the last one)
        if (!isLast)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F1F4),
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}
