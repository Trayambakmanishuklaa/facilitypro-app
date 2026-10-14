import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class MoreController extends GetxController {
  void shareApp() {
    Share.share(
      'Check out FacilityPro Mobile App for professional facility management services!\nhttps://facilitypro.example.com',
    );
  }
}
