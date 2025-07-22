import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Row(
        children: [
          Icon(Icons.recycling, color: Colors.green[600], size: 32),
          const SizedBox(width: 8),
          Text(
            'ReVibe',
            style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
      actions: [
        _buildNavItem(context, 'Home', '/'),
        _buildNavItem(context, 'About Us', '/about'),
        _buildNavItem(context, 'Our Products', '/products'),
        _buildNavItem(context, 'How It\'s Made', '/process'),
        _buildNavItem(context, 'Contact Us', '/contact'),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}