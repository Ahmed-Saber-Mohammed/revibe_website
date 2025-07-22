import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/responsive_helper.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(context),
            _buildProductsSection(context),
            _buildExampleSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green[50]!, Colors.green[100]!],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Our Products',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 48),
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'What We Offer: Each item is made using materials like shredded plastic bottles and tire rubber, carefully processed and turned into wearable fabric.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
                height: 1.6,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          isMobile 
            ? Column(
                children: [
                  _buildProductCard(
                    context,
                    'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                    'Jackets',
                    'Waterproof and lightweight jackets made from recycled materials',
                    ['Waterproof', 'Lightweight', 'Durable'],
                  ),
                  const SizedBox(height: 30),
                  _buildProductCard(
                    context,
                    'https://img.drz.lazcdn.com/g/kf/S058adc44c4534a44aa7efce8e03a916e6.jpg_720x720q80.jpg_.webp',
                    'Activewear',
                    'Breathable and flexible activewear for all your fitness needs',
                    ['Breathable', 'Flexible', 'Moisture-wicking'],
                  ),
                  const SizedBox(height: 30),
                  _buildProductCard(
                    context,
                    'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                    'Footwear',
                    'Durable and stylish shoes crafted from recycled tire rubber',
                    ['Durable', 'Stylish', 'Comfortable'],
                  ),
                ],
              )
            : Row(
                children: [
                  _buildProductCard(
                    context,
                    'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                    'Jackets',
                    'Waterproof and lightweight jackets made from recycled materials',
                    ['Waterproof', 'Lightweight', 'Durable'],
                  ),
                  const SizedBox(width: 40),
                  _buildProductCard(
                    context,
                    'https://images.unsplash.com/photo-1506629905607-d9c36e0a3f90?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                    'Activewear',
                    'Breathable and flexible activewear for all your fitness needs',
                    ['Breathable', 'Flexible', 'Moisture-wicking'],
                  ),
                  const SizedBox(width: 40),
                  _buildProductCard(
                    context,
                    'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                    'Footwear',
                    'Durable and stylish shoes crafted from recycled tire rubber',
                    ['Durable', 'Stylish', 'Comfortable'],
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String imageUrl, String title, String description, List<String> features) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Expanded(
      flex: isMobile ? 0 : 1,
      child: Container(
        width: isMobile ? double.infinity : null,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                imageUrl,
                height: isMobile ? 200 : 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16),
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: features.map((feature) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        feature,
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      color: Colors.green[600],
      child: Column(
        children: [
          Text(
            'Product Example',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 36),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(isMobile ? 20 : 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isMobile 
              ? Column(
                  children: [
                    Icon(Icons.checkroom, size: 40, color: Colors.green[600]),
                    const SizedBox(height: 12),
                    Text(
                      '1 jacket =',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18), 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_drink, size: 30, color: Colors.blue[600]),
                        const SizedBox(width: 8),
                        Text(
                          '12 bottles',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16), 
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.tire_repair, size: 30, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Text(
                          '1 tire',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16), 
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.checkroom, size: 60, color: Colors.green[600]),
                    const SizedBox(width: 20),
                    Text(
                      '1 jacket = ',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 24), 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(Icons.local_drink, size: 40, color: Colors.blue[600]),
                    Text(
                      ' 12 plastic bottles + ',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 24), 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(Icons.tire_repair, size: 40, color: Colors.grey[700]),
                    Text(
                      ' 1 recycled tire',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 24), 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}