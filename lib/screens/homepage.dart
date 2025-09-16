import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import '../screens/appointment_page.dart';
import '../screens/admin_dashboard.dart';
import '../widgets/video_card.dart';
import '../widgets/service_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
              child: Text(
                'RN Infertility Clinic',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.back();
                Get.snackbar(
                  'Navigation',
                  'Returned to Home',
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointments'),
              onTap: () {
                Get.back();
                Get.to(() => const AppointmentPage());
                Get.snackbar(
                  'Navigation',
                  'Navigated to Appointments',
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Get.back();
                Get.to(() => const AdminDashboard());
                Get.snackbar(
                  'Navigation',
                  'Navigated to Profile',
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png', fit: BoxFit.contain),
        ),
        title: Text(
          "RN Infertility Clinic",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Get.snackbar(
              //   'Notifications',
              //   'No new notifications',
              //   snackPosition: SnackPosition.TOP,
              // );
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Notifications'),
                      content: const Text('No new notifications'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).colorScheme.secondary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        "Expert Women's HealthCare",
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Comprehensive gynecological care with compassion and expertise.",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const AppointmentPage());
                          Get.snackbar(
                            'Action',
                            'Navigating to Book Appointment',
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text("Book Appointment"),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "About Our Clinic",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "We provide comprehensive women's health services including routine checkups, prenatal care, family planning, and specialized treatments in a private environment.",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ServiceCard(
                          icon: Icons.medical_information,
                          title: "Expert Care",
                          subtitle: "Board-certified specialists",
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ServiceCard(
                          icon: Icons.security,
                          title: "Safe Environment",
                          subtitle: "Private & Comfortable",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our Facilities",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      GridView.count(
                        crossAxisCount: isLargeScreen ? 4 : 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: [
                          Image.asset('assets/gallery1.png', fit: BoxFit.cover),
                          Image.asset('assets/gallery2.png', fit: BoxFit.cover),
                          Image.asset('assets/gallery3.png', fit: BoxFit.cover),
                          Image.asset('assets/gallery4.png', fit: BoxFit.cover),
                          Image.asset('assets/gallery5.png', fit: BoxFit.cover),
                          Image.asset('assets/gallery6.png', fit: BoxFit.cover),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clinic Reels & Videos",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      VideoCard(
                        videoAsset: 'assets/video2.mp4',
                        title: "8 Foods for Healthy Eyes",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: (index) {
            navController.changeIndex(index);
            switch (index) {
              case 1:
                Get.to(() => const AppointmentPage());
                Get.snackbar(
                  'Navigation',
                  'Navigated to Appointments',
                  snackPosition: SnackPosition.TOP,
                );
                break;
              case 2:
                Get.to(() => const AdminDashboard());
                Get.snackbar(
                  'Navigation',
                  'Navigated to Profile',
                  snackPosition: SnackPosition.TOP,
                );
                break;
              default:
                Get.snackbar(
                  'Navigation',
                  'Selected ${navController.labels[index]}',
                  snackPosition: SnackPosition.TOP,
                );
            }
          },
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Appointments",
            ),

            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
