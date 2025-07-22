import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildProcessSection(),
            _buildImpactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(80),
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
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 800,
            child: Text(
              'Our innovative 4-step process transforms waste into wearable fashion',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessSection() {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          _buildProcessStep(
            1,
            '♻️',
            'Collection',
            'We gather used plastic bottles and tires from recycling centers.',
            true,
          ),
          _buildProcessStep(
            2,
            '🔄',
            'Breakdown',
            'Bottles are melted into polyester fibers; tires are cleaned and shredded.',
            false,
          ),
          _buildProcessStep(
            3,
            '🧵',
            'Fabric Creation',
            'The materials are blended into new, durable fabric.',
            true,
          ),
          _buildProcessStep(
            4,
            '👕',
            'Design & Production',
            'The fabric is turned into stylish clothing items.',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(int step, String emoji, String title, String description, bool isLeft) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: [
          if (isLeft) ...[
            Expanded(
              child: _buildStepContent(step, emoji, title, description),
            ),
            const SizedBox(width: 60),
            _buildStepIndicator(step),
          ] else ...[
            _buildStepIndicator(step),
            const SizedBox(width: 60),
            Expanded(
              child: _buildStepContent(step, emoji, title, description),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStepContent(int step, String emoji, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(30),
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
          Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step) {
    return Container(
      width: 80,
      height: 80,
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
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildImpactSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Environmental Impact',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              _buildImpactCard(
                Icons.water_drop,
                'Keeps waste out of oceans and landfills',
              ),
              _buildImpactCard(
                Icons.energy_savings_leaf,
                'Uses less water and energy than traditional fabric production',
              ),
              _buildImpactCard(
                Icons.campaign,
                'Spreads awareness of responsible fashion',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImpactCard(IconData icon, String description) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(30),
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
            Icon(icon, size: 60, color: Colors.green[600]),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
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