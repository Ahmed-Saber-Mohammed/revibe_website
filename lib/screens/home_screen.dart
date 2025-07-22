import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/responsive_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildFeaturesSection(context),
            _buildCallToActionSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getResponsivePadding(context);
    
    return Container(
      constraints: BoxConstraints(
        minHeight: isMobile ? 500 : 600,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green[50]!, Colors.green[100]!],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: isMobile 
          ? Column(
              children: [
                _buildHeroContent(context),
                const SizedBox(height: 32),
                _buildHeroImage(context),
              ],
            )
          : Row(
              children: [
                Expanded(child: _buildHeroContent(context)),
                Expanded(child: _buildHeroImage(context)),
              ],
            ),
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'ReVibe',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 48),
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Turning Waste Into Wear',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 32),
            fontWeight: FontWeight.w300,
            color: Colors.green[700],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome to ReVibe, a sustainable fashion concept that transforms plastic bottles and used tires into stylish, durable clothing. We believe fashion can help the planet instead of hurting it. Our mission is simple: reduce waste, promote circular design, and create high-quality products you can wear with pride.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
            height: 1.6,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 32),
        isMobile 
          ? Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/products'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: Text(
                      'Explore Products',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16), 
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/about'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green[600]!),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: Text(
                      'Learn More',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16), 
                        color: Colors.green[600]
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/products'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    'Explore Products',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16), 
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/about'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green[600]!),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    'Learn More',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16), 
                      color: Colors.green[600]
                    ),
                  ),
                ),
              ],
            ),
      ],
    );
  }

  Widget _buildHeroImage(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      margin: EdgeInsets.all(isMobile ? 20 : 40),
      height: isMobile ? 250 : 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Text(
            'Why Choose ReVibe?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 36),
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          isMobile 
            ? Column(
                children: [
                  _buildFeatureCard(context, Icons.recycling, 'Eco-Friendly', 'Made from recycled plastic bottles and tires'),
                  const SizedBox(height: 20),
                  _buildFeatureCard(context, Icons.high_quality, 'High Quality', 'Durable and comfortable clothing that lasts'),
                  const SizedBox(height: 20),
                  _buildFeatureCard(context, Icons.style, 'Stylish Design', 'Modern, trendy designs for every occasion'),
                ],
              )
            : Row(
                children: [
                  _buildFeatureCard(context, Icons.recycling, 'Eco-Friendly', 'Made from recycled plastic bottles and tires'),
                  _buildFeatureCard(context, Icons.high_quality, 'High Quality', 'Durable and comfortable clothing that lasts'),
                  _buildFeatureCard(context, Icons.style, 'Stylish Design', 'Modern, trendy designs for every occasion'),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String title, String description) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Expanded(
      flex: isMobile ? 0 : 1,
      child: Container(
        width: isMobile ? double.infinity : null,
        margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 20),
        padding: EdgeInsets.all(isMobile ? 20 : 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: isMobile ? 40 : 60, color: Colors.green[600]),
            SizedBox(height: isMobile ? 12 : 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 24),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: isMobile ? 8 : 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16),
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToActionSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      color: Colors.green[600],
      child: Column(
        children: [
          Text(
            'Ready to Make a Difference?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 36),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Join us in creating a more sustainable future through fashion',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
            child: Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
                color: Colors.green[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}