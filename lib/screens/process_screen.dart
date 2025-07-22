import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/responsive_helper.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(context),
            _buildProcessSection(context),
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
            'How It\'s Made',
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
              'Our innovative 4-step process transforms waste into wearable fashion',
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

  Widget _buildProcessSection(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          _buildProcessStep(
            context,
            1,
            '♻️',
            'Collection',
            'We gather used plastic bottles and tires from recycling centers.',
          ),
          SizedBox(height: isMobile ? 20 : 40),
          _buildProcessStep(
            context,
            2,
            '🔄',
            'Breakdown',
            'Bottles are melted into polyester fibers; tires are cleaned and shredded.',
          ),
          SizedBox(height: isMobile ? 20 : 40),
          _buildProcessStep(
            context,
            3,
            '🧵',
            'Fabric Creation',
            'The materials are blended into new, durable fabric.',
          ),
          SizedBox(height: isMobile ? 20 : 40),
          _buildProcessStep(
            context,
            4,
            '👕',
            'Design & Production',
            'The fabric is turned into stylish clothing items.',
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(BuildContext context, int step, String emoji, String title, String description) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: isMobile ? 10 : 20),
      child: isMobile 
        ? Column(
            children: [
              _buildStepIndicator(context, step),
              const SizedBox(height: 20),
              _buildStepContent(context, emoji, title, description),
            ],
          )
        : Row(
            children: step.isOdd 
              ? [
                  Expanded(child: _buildStepContent(context, emoji, title, description)),
                  const SizedBox(width: 60),
                  _buildStepIndicator(context, step),
                ]
              : [
                  _buildStepIndicator(context, step),
                  const SizedBox(width: 60),
                  Expanded(child: _buildStepContent(context, emoji, title, description)),
                ],
          ),
    );
  }

  Widget _buildStepContent(BuildContext context, String emoji, String title, String description) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
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
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Text(
                emoji,
                style: TextStyle(fontSize: isMobile ? 30 : 40),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 28),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16),
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(BuildContext context, int step) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final size = isMobile ? 60.0 : 80.0;
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green[600],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          step.toString(),
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 32),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
            'Environmental Impact',
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
                  _buildImpactCard(
                    context,
                    Icons.water_drop,
                    'Keeps waste out of oceans and landfills',
                  ),
                  const SizedBox(height: 20),
                  _buildImpactCard(
                    context,
                    Icons.energy_savings_leaf,
                    'Uses less water and energy than traditional fabric production',
                  ),
                  const SizedBox(height: 20),
                  _buildImpactCard(
                    context,
                    Icons.campaign,
                    'Spreads awareness of responsible fashion',
                  ),
                ],
              )
            : Row(
                children: [
                  _buildImpactCard(
                    context,
                    Icons.water_drop,
                    'Keeps waste out of oceans and landfills',
                  ),
                  _buildImpactCard(
                    context,
                    Icons.energy_savings_leaf,
                    'Uses less water and energy than traditional fabric production',
                  ),
                  _buildImpactCard(
                    context,
                    Icons.campaign,
                    'Spreads awareness of responsible fashion',
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildImpactCard(BuildContext context, IconData icon, String description) {
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
}