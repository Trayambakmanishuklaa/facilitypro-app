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
                _buildQuickActionButtons(),
                const SizedBox(height: 24),
                _buildSectionHeader('Our Core Services', onSeeAll: () {
                  Get.toNamed(Routes.SERVICES);
                }),
                _buildServicesGrid(),
                const SizedBox(height: 24),
                _buildWhyChooseUs(),
                const SizedBox(height: 24),
                _buildSectionHeader('Industries Served', onSeeAll: () {
                  Get.toNamed(Routes.INDUSTRIES);
                }),
                _buildIndustriesList(),
                const SizedBox(height: 24),
                _buildSectionHeader('Featured Projects', onSeeAll: () {
                  Get.toNamed(Routes.PROJECTS);
                }),
                _buildProjectsList(),
                const SizedBox(height: 24),
                _buildSectionHeader('Frequently Asked Questions'),
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
      color: AppColors.primary,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to FacilityPro',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          const Text(
            'Smart & Integrated Property Operations',
            style: TextStyle(
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
              child: const Row(
                children: [
                  Icon(Icons.search, color: AppColors.textSecondary, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Search services (e.g. Soft Services, MEP, IFM)...',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 13),
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
                child: const Text('Get Quote', style: TextStyle(fontWeight: FontWeight.bold)),
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
                child: const Text('Contact Us'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildActionCard(
              icon: Icons.request_quote_rounded,
              title: 'Request Quote',
              color: AppColors.primary,
              onTap: () => Get.toNamed(Routes.QUOTE),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionCard(
              icon: Icons.support_agent_rounded,
              title: 'Contact Sales',
              color: AppColors.accent,
              onTap: () => Get.toNamed(Routes.CONTACT),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionCard(
              icon: Icons.work_outline_rounded,
              title: 'Careers',
              color: AppColors.secondary,
              onTap: () => Get.toNamed(Routes.CAREERS),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
            ),
          ],
        ),
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
              child: const Row(
                children: [
                  Text('See All', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                  Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.primary),
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
          const Text(
            'Why Choose FacilityPro?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
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
