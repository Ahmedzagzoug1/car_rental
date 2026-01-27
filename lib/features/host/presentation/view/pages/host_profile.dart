import 'package:flutter/material.dart';

class HostProfile extends StatelessWidget {
  const HostProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              const Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?fit=crop&w=800&q=80',
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Felicia Lopez',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Joined Sep 2020',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Menu Items Section 1
              _buildSectionTitle('General'),
              _buildMenuItem(context, 'Account'),
              const Divider(color: Colors.grey, height: 1),
              _buildMenuItem(context, 'Transaction History'),
              const SizedBox(height: 24),

              // Menu Items Section 2
              _buildSectionTitle('About'),
              _buildMenuItem(context, 'How EcoFlex Works'),
              const Divider(color: Colors.grey, height: 1),
              _buildMenuItem(context, 'Contact Support'),
              const Divider(color: Colors.grey, height: 1),
              _buildMenuItem(context, 'Legal'),
              const SizedBox(height: 24),

              // Menu Items Section 3
              _buildSectionTitle('Log out'),
              _buildMenuItem(context, 'Log out', isLogout: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title,
      {bool isLogout = false}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
              color: isLogout ? Colors.green : Colors.black,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            // Handle menu item tap
          },
        ),
        if (!isLogout) const Divider(color: Colors.grey, height: 1),
      ],
    );
  }
}