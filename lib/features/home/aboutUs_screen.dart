import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String phone = "+94771234567";
  final String email = "info@theslate.com";

  final String mapUrl =
      "https://www.google.com/maps/search/?api=1&query=Colombo+Sri+Lanka";

  final String facebookUrl = "https://facebook.com/";
  final String instagramUrl = "https://instagram.com/";
  final String whatsappUrl = "https://wa.me/94771234567";

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "About Us",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LOGO SECTION
            Center(
              child: Column(
                children: const [
                  Icon(Icons.restaurant, size: 70, color: Colors.black),
                  SizedBox(height: 10),
                  Text(
                    "The Slate",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Who We Are",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              "The Slate is a modern restaurant delivering fresh, high-quality meals with a seamless digital experience.",
              style: TextStyle(height: 1.6, fontSize: 15),
            ),

            const SizedBox(height: 25),

            const Text(
              "Contact",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("+94 77 123 4567"),
              onTap: () => launchURL("tel:$phone"),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("info@theslate.com"),
              onTap: () => launchURL("mailto:$email"),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Colombo, Sri Lanka"),
              onTap: () => launchURL(mapUrl),
            ),

            const SizedBox(height: 30),

            /// SOCIAL MEDIA
            const Center(
              child: Text(
                "Follow Us",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, size: 30),
                  onPressed: () => launchURL(facebookUrl),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera_alt, size: 30),
                  onPressed: () => launchURL(instagramUrl),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.chat, size: 30),
                  onPressed: () => launchURL(whatsappUrl),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
