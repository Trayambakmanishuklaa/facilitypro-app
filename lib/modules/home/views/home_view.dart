import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.apartment_rounded, size: 20, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text(
              AppConstants.appName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              Get.snackbar('Notifications', 'No new notifications');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingWidget(message: 'Loading FacilityPro Dashboard...');
        }

        return RefreshIndicator(
          onRefresh: controller.loadHomeData,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderGreeting(),
                const SizedBox(height: 16),
                _buildHeroBanner(),
                const SizedBox(height: 24),
                _buildSectionHeader('core_services'.tr, onSeeAll: () {
                  Get.toNamed(Routes.SERVICES);
                }),
                _buildServicesGrid(),
                const SizedBox(height: 24),
                _buildWhyChooseUs(),
                const SizedBox(height: 24),
                _buildCareersBanner(),
                const SizedBox(height: 24),
                _buildSectionHeader('industries_served'.tr, onSeeAll: () {
                  Get.toNamed(Routes.INDUSTRIES);
                }),
                _buildIndustriesList(),
                const SizedBox(height: 24),
                _buildSectionHeader('featured_projects'.tr, onSeeAll: () {
                  Get.toNamed(Routes.PROJECTS);
                }),
                _buildProjectsList(),
                const SizedBox(height: 24),
                _buildSectionHeader('faqs'.tr),
                _buildFaqSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHeaderGreeting() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'welcome'.tr,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          Text(
            'tagline'.tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.SERVICES),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.textSecondary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'search_hint'.tr,
                    style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'ISO 9001:2015 Certified',
              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Transforming Property & Facility Management',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'We ensure seamless operations, 99.8% asset uptime, and world-class hygiene standards.',
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  minimumSize: const Size(120, 38),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onPressed: () => Get.toNamed(Routes.QUOTE),
                child: Text('get_quote'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  minimumSize: const Size(120, 38),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onPressed: () => Get.toNamed(Routes.CONTACT),
                child: Text('contact_us'.tr),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCareersBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'careers'.tr.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'careers_banner_title'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'careers_banner_sub'.tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(120, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Get.toNamed(Routes.CAREERS),
                  icon: const Icon(Icons.work_rounded, size: 16),
                  label: Text(
                    'apply_position'.tr,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.business_center_rounded, size: 48, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              child: Row(
                children: [
                  Text('see_all'.tr, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                  const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.primary),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.featuredServices.length,
        itemBuilder: (context, index) {
          final service = controller.featuredServices[index];
          return CustomCard(
            padding: const EdgeInsets.all(12),
            onTap: () {
              Get.toNamed(Routes.SERVICE_DETAIL, arguments: service);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    service.imageUrl,
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 90,
                      color: AppColors.surfaceMuted,
                      child: const Icon(Icons.business_center, color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  service.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  service.summary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWhyChooseUs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'why_choose'.tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildMetric('50M+', 'Sq. Ft. Managed'),
              _buildMetric('99.8%', 'SLA Compliance'),
              _buildMetric('24/7', 'Command Center'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildIndustriesList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: controller.industries.length,
        itemBuilder: (context, index) {
          final ind = controller.industries[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            child: CustomCard(
              padding: const EdgeInsets.all(10),
              onTap: () => Get.toNamed(Routes.INDUSTRIES),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.domain_rounded, size: 28, color: AppColors.accent),
                  const SizedBox(height: 8),
                  Text(
                    ind.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectsList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: controller.featuredProjects.length,
        itemBuilder: (context, index) {
          final project = controller.featuredProjects[index];
          return Container(
            width: 240,
            margin: const EdgeInsets.only(right: 12),
            child: CustomCard(
              padding: EdgeInsets.zero,
              onTap: () => Get.toNamed(Routes.PROJECTS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    project.imageUrl,
                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 110,
                      color: AppColors.surfaceMuted,
                      child: const Icon(Icons.apartment, color: AppColors.primary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          project.location,
                          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFaqSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(controller.faqs.length, (index) {
          final faq = controller.faqs[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: Material(
              color: Colors.white,
              child: ExpansionTile(
                key: Key('faq_$index'),
                title: Text(
                  faq.question,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      faq.answer,
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
