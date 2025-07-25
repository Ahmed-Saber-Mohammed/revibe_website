  import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/responsive_helper.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(context),
            _buildMissionSection(context),
            _buildImpactSection(context),
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
            'About ReVibe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 48),
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Who We Are',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 24),
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'ReVibe is an eco-friendly fashion startup created by students with a vision to tackle pollution through innovation. Every year, millions of plastic bottles and tires end up in landfills or oceans. We decided to turn this problem into a solution.',
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

  Widget _buildMissionSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(padding),
      child: isMobile 
        ? Column(
            children: [
              _buildMissionContent(context),
              const SizedBox(height: 40),
              _buildMissionImage(context),
            ],
          )
        : Row(
            children: [
              Expanded(child: _buildMissionContent(context)),
              const SizedBox(width: 60),
              Expanded(child: _buildMissionImage(context)),
            ],
          ),
    );
  }

  Widget _buildMissionContent(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Our Goal',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 32),
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'To create comfortable, high-quality clothing using recycled plastic bottles and tires, while raising awareness about sustainable living.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
            height: 1.6,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Why It Matters',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 32),
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'By giving waste a second life, we reduce pollution, lower carbon footprints, and lead a new wave of ethical fashion.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
            height: 1.6,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildMissionImage(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
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
          'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildImpactSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Our Impact',
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
                  Row(
                    children: [
                      Expanded(child: _buildImpactCard(context, '1000+', 'Bottles Recycled')),
                      const SizedBox(width: 20),
                      Expanded(child: _buildImpactCard(context, '50+', 'Tires Repurposed')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildImpactCard(context, '100+', 'Products Created')),
                      const SizedBox(width: 20),
                      Expanded(child: _buildImpactCard(context, '25%', 'Carbon Reduction')),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImpactCard(context, '1000+', 'Bottles Recycled'),
                  _buildImpactCard(context, '50+', 'Tires Repurposed'),
                  _buildImpactCard(context, '100+', 'Products Created'),
                  _buildImpactCard(context, '25%', 'Carbon Reduction'),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildImpactCard(BuildContext context, String number, String label) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 36),
              fontWeight: FontWeight.bold,
              color: Colors.green[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}