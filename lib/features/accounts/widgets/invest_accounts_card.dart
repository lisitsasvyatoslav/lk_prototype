import 'package:flutter/material.dart';
import 'account_row.dart';
import '../screens/account_details_modal.dart';
import '../../../core/theme/appcolors.dart';

class InvestAccountsCard extends StatelessWidget {
  const InvestAccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgBaseDefault,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: AccountRow(
        balance: '87 198 345,33 ₽',
        changeText: '−2947,23 ₽',
        changeColor: const Color(0xFFE64646),
        number: '15185RI112B',
        subtitle: 'КЛФ-9182323',
        badge: 'иис',
        onTap: (ctx) => showAccountDetailsModal(
          ctx,
          title: 'КЛФ-9182323',
          number: '15185RI112B',
          isIIS: true,
        ),
      ),
    );
  }
}


