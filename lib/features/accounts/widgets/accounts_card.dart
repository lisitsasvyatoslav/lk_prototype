import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_row.dart';
import '../screens/account_details_modal.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 1, thickness: 1, color: Color(0xFFEAECEE));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          AccountRow(
            balance: '1 593 742,90 ₽',
            changeText: '−2947,23 ₽',
            changeColor: Color(0xFFE64646),
            number: '15185RI112B',
            subtitle: 'Деньги на ветер',
            isFavorite: true,
            onTap: (ctx) => showAccountDetailsModal(
              ctx,
              title: 'Деньги на ветер',
              number: '15185RI112B',
            ),
          ),
          divider,
          AccountRow(
            balance: '87 198 345,33 ₽',
            changeText: '+2947,23 ₽',
            changeColor: Color(0xFF17A555),
            number: '15185RI112B',
            subtitle: 'КЛФ-918353',
            badge: 'иис',
            onTap: (ctx) => showAccountDetailsModal(
              ctx,
              title: 'КЛФ-918353',
              number: '15185RI112B',
              isIIS: true,
            ),
          ),
          divider,
          AccountRow(
            balance: '448 742,90 ₽',
            changeText: '−2947,23 ₽',
            changeColor: Color(0xFFE64646),
            number: '15355R1',
            subtitle: 'Demo',
            secondaryLine: 'Действует до 26 сент 2025',
            onTap: (ctx) => showAccountDetailsModal(
              ctx,
              title: 'Demo',
              number: '15355R1',
            ),
          ),
        ],
      ),
    );
  }
}


