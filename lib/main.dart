import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const EsportsApp());
}

class EsportsApp extends StatelessWidget {
  const EsportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Esports Arena',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        primaryColor: const Color(0xFF2563EB),
      ),
      home: const HomeScreen(),
    );
  }
}

// ---------------------------------------------------------------------
// HOME SCREEN
// ---------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REBELX ESPORTS',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet,
                color: Color(0xFF2563EB)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WalletScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notice Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.campaign, color: Color(0xFF2563EB)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Welcome to RebelX Esports! Daily BGMI & Free Fire Tournaments.',
                      style: TextStyle(
                          color: Color(0xFF1E3A8A),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Feature Buttons (Refer, Leaderboard, Support)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickButton(context, Icons.share, 'Refer & Earn',
                    Colors.purple, const ReferScreen()),
                _buildQuickButton(context, Icons.emoji_events, 'Leaderboard',
                    Colors.amber.shade700, const LeaderboardScreen()),
                _buildQuickButton(
                    context, Icons.support_agent, 'Support', Colors.green, null),
              ],
            ),
            const SizedBox(height: 25),

            const Text('SELECT GAME',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A))),
            const SizedBox(height: 12),
            _buildGameCard(context, 'BGMI TOURNAMENTS', '15+ Daily Matches',
                const Color(0xFFEA580C)),
            const SizedBox(height: 12),
            _buildGameCard(context, 'FREE FIRE MAX', '10+ Daily Matches',
                const Color(0xFFDC2626)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickButton(BuildContext context, IconData icon, String label,
      Color color, Widget? targetScreen) {
    return InkWell(
      onTap: () {
        if (targetScreen != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => targetScreen));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Opening WhatsApp Support...')),
          );
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF334155))),
        ],
      ),
    );
  }

  Widget _buildGameCard(
      BuildContext context, String title, String subtitle, Color brandColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: brandColor)),
          const SizedBox(height: 5),
          Text(subtitle, style: const TextStyle(color: Color(0xFF64748B))),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: brandColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MatchesScreen(gameTitle: title)),
              );
            },
            child: const Text('View Matches',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------
// WALLET SCREEN
// ---------------------------------------------------------------------
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('My Wallet',
            style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text('Total Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 8),
                  Text('₹150.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text('ADD MONEY',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDC2626),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    icon: const Icon(Icons.arrow_upward, color: Colors.white),
                    label: const Text('WITHDRAW',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Transaction History Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Recent Transactions',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            ),
            const SizedBox(height: 12),

            // Sample History List
            _buildTransactionTile(
                'Match #101 Entry Fee', '- ₹20.00', Colors.red, 'Today, 2:30 PM'),
            _buildTransactionTile(
                'Added via UPI', '+ ₹100.00', Colors.green, 'Yesterday, 6:15 PM'),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTile(String title, String amount, Color color, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: Text(amount,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}

// ---------------------------------------------------------------------
// MATCHES SCREEN
// ---------------------------------------------------------------------
class MatchesScreen extends StatelessWidget {
  final String gameTitle;
  const MatchesScreen({super.key, required this.gameTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(gameTitle,
            style: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMatchCard(context, 'Match #101 - Solo Battle', '10:00 PM', '₹20',
              '₹300', '₹10', 'ROOM: 884920'),
        ],
      ),
    );
  }

  Widget _buildMatchCard(BuildContext context, String title, String time, String fee,
      String prize, String perKill, String roomId) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Chip(
                  label: Text(time, style: const TextStyle(fontSize: 12, color: Colors.white)),
                  backgroundColor: const Color(0xFF2563EB)),
            ],
          ),
          const Divider(height: 20),
          // One-Click Room ID Copy Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration:
                BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(roomId, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: roomId));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Room ID Copied!')));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.copy, size: 16, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('COPY',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF16A34A)),
              onPressed: () {},
              child: const Text('JOIN NOW',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------
// REFER SCREEN
// ---------------------------------------------------------------------
class ReferScreen extends StatelessWidget {
  const ReferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String referCode = "REBEL100";

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Refer & Earn',
            style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Icon(Icons.card_giftcard, size: 80, color: Color(0xFF2563EB)),
            const SizedBox(height: 15),
            const Text('Invite Friends & Earn ₹20',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Jab aapka dost register karega, dono ko ₹20 bonus milega.',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(referCode,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2563EB)),
                    icon: const Icon(Icons.copy, size: 16, color: Colors.white),
                    label: const Text('COPY', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(text: referCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Referral Code Copied!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------
// LEADERBOARD SCREEN
// ---------------------------------------------------------------------
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Top Players Leaderboard',
            style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLeaderTile('1', 'ProSniper_99', '₹5,400 Won', Colors.amber),
          _buildLeaderTile('2', 'GamerX_OP', '₹4,100 Won', Colors.grey),
          _buildLeaderTile('3', 'RebelKing', '₹3,200 Won', Colors.brown),
        ],
      ),
    );
  }

  Widget _buildLeaderTile(String rank, String name, String winnings, Color badgeColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: badgeColor,
          child: Text(rank, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Badge: Pro Player'),
        trailing: Text(winnings,
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}

