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










// import 'package:flutter/material.dart';
// import '../widgets/app_bar_widget.dart';

// class ProductsScreen extends StatelessWidget {
//   const ProductsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeaderSection(),
//             _buildProductsSection(),
//             _buildExampleSection(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeaderSection() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(80),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Colors.green[50]!, Colors.green[100]!],
//         ),
//       ),
//       child: Column(
//         children: [
//           Text(
//             'Our Products',
//             style: TextStyle(
//               fontSize: 48,
//               fontWeight: FontWeight.bold,
//               color: Colors.green[800],
//             ),
//           ),
//           const SizedBox(height: 20),
//           const SizedBox(
//             width: 800,
//             child: Text(
//               'What We Offer: Each item is made using materials like shredded plastic bottles and tire rubber, carefully processed and turned into wearable fabric.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 height: 1.6,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductsSection() {
//     return Container(
//       padding: const EdgeInsets.all(80),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               _buildProductCard(
//                 'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
//                 'Jackets',
//                 'Waterproof and lightweight jackets made from recycled materials',
//                 ['Waterproof', 'Lightweight', 'Durable'],
//               ),
//               const SizedBox(width: 40),
//               _buildProductCard(
//                 'data:image/jpeg;base64,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',
//                 'Activewear',
//                 'Breathable and flexible activewear for all your fitness needs',
//                 ['Breathable', 'Flexible', 'Moisture-wicking'],
//               ),
//               const SizedBox(width: 40),
//               _buildProductCard(
//                 'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
//                 'Footwear',
//                 'Durable and stylish shoes crafted from recycled tire rubber',
//                 ['Durable', 'Stylish', 'Comfortable'],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(String imageUrl, String title, String description, List<String> features) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 20,
//               offset: const Offset(0, 10),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//               child: Image.network(
//                 imageUrl,
//                 height: 250,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     description,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                       height: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Wrap(
//                     spacing: 8,
//                     runSpacing: 8,
//                     children: features.map((feature) => Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.green[100],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         feature,
//                         style: TextStyle(
//                           color: Colors.green[800],
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     )).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildExampleSection() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(80),
//       color: Colors.green[600],
//       child: Column(
//         children: [
//           const Text(
//             'Product Example',
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 40),
//           Container(
//             padding: const EdgeInsets.all(40),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.checkroom, size: 60, color: Colors.green[600]),
//                 const SizedBox(width: 20),
//                 const Text(
//                   '1 jacket = ',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                 ),
//                 Icon(Icons.local_drink, size: 40, color: Colors.blue[600]),
//                 const Text(
//                   ' 12 plastic bottles + ',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                 ),
//                 Icon(Icons.tire_repair, size: 40, color: Colors.grey[700]),
//                 const Text(
//                   ' 1 recycled tire',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }