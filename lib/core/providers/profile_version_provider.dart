import 'package:flutter/material.dart';
import '../../features/profile/screens/profile_screen_a.dart';
import '../../features/profile/screens/profile_screen_b.dart';

enum ProfileVersion { versionA, versionB }

class ProfileVersionProvider extends ChangeNotifier {
  ProfileVersion _selectedVersion = ProfileVersion.versionA;

  ProfileVersion get selectedVersion => _selectedVersion;

  void setVersion(ProfileVersion version) {
    _selectedVersion = version;
    notifyListeners();
  }

  Widget getProfileScreen() {
    switch (_selectedVersion) {
      case ProfileVersion.versionA:
        return const ProfileScreenA();
      case ProfileVersion.versionB:
        return const ProfileScreenB();
    }
  }
}
