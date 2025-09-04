import 'package:flutter/material.dart';
import 'custom_menu.dart';
import '../../../core/theme/appcolors.dart';

class MenusSection extends StatelessWidget {
  const MenusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMenu(
          items: [
            MenuItemData(
              icon: Icons.person_outline,
              title: "Личный кабинет",
              onTap: () => debugPrint("Открыть личный кабинет"),
            ),
            MenuItemData(
              icon: Icons.currency_ruble_outlined,
              title: "Подписка",
              trailing: const CustomBadge(text: "BASIC"),
              onTap: () => debugPrint("Открыть подписку"),
            ),
            MenuItemData(
              icon: Icons.description_outlined,
              title: "Документы",
              trailing: const Counter(text: "99+", isLarge: true),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              icon: Icons.settings,
              title: "Настройки приложения",
              onTap: () => debugPrint("Открыть настройки приложения"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              icon: Icons.mobile_friendly_outlined,
              title: "Возможности FinamTrade",
              onTap: () => debugPrint("Возможности FinamTrade"),
            ),
            MenuItemData(
              icon: Icons.help_outline,
              title: "Частые вопросы",
              onTap: () => debugPrint("Частые вопросы"),
            ),
            MenuItemData(
              icon: Icons.star_border,
              title: "Оценить приложение",
              onTap: () => debugPrint("Оценить приложение"),
            ),
            MenuItemData(
              icon: Icons.share_outlined,
              title: "Поделиться приложением",
              onTap: () => debugPrint("Поделиться приложением"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              icon: Icons.description_outlined,
              title: "Пользовательское соглашение",
              onTap: () => debugPrint("Пользовательское соглашение"),
            ),
            MenuItemData(
              icon: Icons.description_outlined,
              title: "Политика конфиденциальности",
              onTap: () => debugPrint("Политика конфиденциальности"),
            ),
            MenuItemData(
              icon: Icons.email_outlined,
              title: "Обращение в компанию",
              onTap: () => debugPrint("Обращение в компанию"),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMenu(
          items: [
            MenuItemData(
              icon: Icons.logout_outlined,
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
