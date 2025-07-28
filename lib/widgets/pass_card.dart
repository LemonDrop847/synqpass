import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../themes/tier_colors.dart';

class PassCard extends StatefulWidget {
  final String username;
  final String level;
  final String userId;
  final String appendingString;
  final String clubName;
  final String eventDetails;
  final String? logoUrl;

  const PassCard({
    super.key,
    required this.username,
    required this.level,
    required this.userId,
    required this.appendingString,
    required this.clubName,
    required this.eventDetails,
    this.logoUrl,
  });

  @override
  State<PassCard> createState() => _PassCardState();
}

class _PassCardState extends State<PassCard>
    with SingleTickerProviderStateMixin {
  late String qrData;
  late TierStyle tierStyle;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    tierStyle = _getTierStyle(widget.level);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _generateQrData();
  }

  @override
  void didUpdateWidget(PassCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.level != oldWidget.level) {
      setState(() {
        tierStyle = _getTierStyle(widget.level);
        _generateQrData();
      });
    }
  }

  TierStyle _getTierStyle(String level) {
    switch (level.toLowerCase()) {
      case 'gold':
        return TierColors.gold;
      case 'platinum':
        return TierColors.platinum;
      default:
        return TierColors.silver;
    }
  }

  void _generateQrData() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      qrData = '${widget.userId}-${widget.appendingString}-$timestamp';
    });
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: tierStyle.cardBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: tierStyle.textPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.logoUrl != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.logoUrl!),
                    radius: 16,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              Text(
                widget.clubName,
                style: GoogleFonts.orbitron(
                  fontWeight: FontWeight.bold,
                  color: tierStyle.textPrimary,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: tierStyle.textPrimary.withAlpha(204),
              ),
              onPressed: _generateQrData,
              tooltip: 'Refresh QR Code',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'MEMBERSHIP',
                style: GoogleFonts.robotoCondensed(
                  color: tierStyle.textSecondary,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    widget.level.toUpperCase(),
                    style: GoogleFonts.oswald(
                      color: tierStyle.textPrimary,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.contactless_outlined,
                    color: tierStyle.primaryAccent,
                    size: 32,
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(26),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: MediaQuery.of(context).size.width * 0.7,
                      gapless: false,
                      dataModuleStyle: QrDataModuleStyle(
                        color: tierStyle.secondaryAccent,
                        dataModuleShape: QrDataModuleShape.circle,
                      ),
                      eyeStyle: QrEyeStyle(
                        color: tierStyle.secondaryAccent,
                        eyeShape: QrEyeShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('MEMBER', widget.username),
                  _buildInfoColumn(
                    'EVENT',
                    widget.eventDetails,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
    String title,
    String value, {
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoCondensed(
            color: tierStyle.textSecondary,
            fontSize: 14,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.oswald(
            color: tierStyle.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
