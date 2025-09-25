import 'package:flutter/material.dart';
import 'custom_menu.dart';
import '../../../core/theme/appcolors.dart';
import '../../accounts/widgets/index.dart';
import '../../tariff/screens/tariffs_sheet_a.dart';

class MenusSection extends StatelessWidget {
  const MenusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMenu(
          items: [
            MenuItemData(
              svgIcon: 'assets/icons/person.svg',
              title: "Личный кабинет",
              onTap: () => debugPrint("Открыть личный кабинет"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/ruble_coin.svg',
              title: "Подписка",
              trailing: const CustomBadge(text: "BASIC"),
              onTap: () => debugPrint("Открыть подписку"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/wallet.svg',
              title: "Управление счетами",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountsListScreen(),
                  ),
                );
              },
            ),
            MenuItemData(
              svgIcon: 'assets/icons/tariffs.svg',
              title: "Тарифы",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TariffsScreen(),
                  ),
                );
              },
            ),
            MenuItemData(
              svgIcon: 'assets/icons/envelope.svg',
              title: "Уведомления",
              trailing: const Counter(text: "1", isLarge: true),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/doc.svg',
              title: "Документы",
              trailing: const Counter(text: "99+", isLarge: true),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              svgIcon: 'assets/icons/cog.svg',
              title: "Настройки приложения",
              onTap: () => debugPrint("Открыть настройки приложения"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              svgIcon: 'assets/icons/phone_magic.svg',
              title: "Возможности FinamTrade",
              onTap: () => debugPrint("Возможности FinamTrade"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/question_circle.svg',
              title: "Частые вопросы",
              onTap: () => debugPrint("Частые вопросы"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/star_outlined.svg',
              title: "Оценить приложение",
              onTap: () => debugPrint("Оценить приложение"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/share.svg',
              title: "Поделиться приложением",
              onTap: () => debugPrint("Поделиться приложением"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              svgIcon: 'assets/icons/doc.svg',
              title: "Пользовательское соглашение",
              onTap: () => debugPrint("Пользовательское соглашение"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/doc.svg',
              title: "Политика конфиденциальности",
              onTap: () => debugPrint("Политика конфиденциальности"),
            ),
            MenuItemData(
              svgIcon: 'assets/icons/envelope.svg',
              title: "Обращение в компанию",
              onTap: () => debugPrint("Обращение в компанию"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              svgIcon: 'assets/icons/logout.svg',
              title: "Выйти",
              onTap: () => debugPrint("Выйти из аккаунта"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          "Версия приложения 9.8.0",
          style: TextStyle(fontSize: 12, color: AppColors.textBaseSecondary),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
