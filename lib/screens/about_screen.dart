  import 'package:flutter/material.dart';
  import '../widgets/app_bar_widget.dart';

  class AboutScreen extends StatelessWidget {
    const AboutScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeaderSection(),
              _buildMissionSection(),
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
              'About ReVibe',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Who We Are',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 800,
              child: Text(
                'ReVibe is an eco-friendly fashion startup created by students with a vision to tackle pollution through innovation. Every year, millions of plastic bottles and tires end up in landfills or oceans. We decided to turn this problem into a solution.',
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

    Widget _buildMissionSection() {
      return Container(
        padding: const EdgeInsets.all(80),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Goal',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'To create comfortable, high-quality clothing using recycled plastic bottles and tires, while raising awareness about sustainable living.',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Why It Matters',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'By giving waste a second life, we reduce pollution, lower carbon footprints, and lead a new wave of ethical fashion.',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 60),
            Expanded(
              child: Container(
                height: 400,
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
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

  }