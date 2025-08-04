import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Color palette
  static const Color _primaryColor = Color(0xFF6B5CE7);
  static const Color _backgroundColor = Color(0xFFF8F9FF);
  static const Color _cardColor = Colors.white;
  static const Color _textPrimary = Color(0xFF1A1A1A);
  static const Color _textSecondary = Color(0xFF6B7280);

  // Add a scaffold key to access the scaffold from anywhere
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // PageController for image carousel
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Timer for auto-scrolling carousel
  Timer? _carouselTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _backgroundColor,
      endDrawer: _buildDrawer(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF6B5CE7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                _buildHeader(),
                _buildFeatureButtons(),
                _buildSearchBar(),
              ],
            ),
          ),
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Row(
        children: [
          // University DP
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/university_logo.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Title
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rani Channamma',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'University, Belagavi',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Menu button
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildFeatureButton(
              icon: Icons.people,
              title: 'Network',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildFeatureButton(
              icon: Icons.event,
              title: 'Events',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildFeatureButton(
              icon: Icons.work,
              title: 'Jobs',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildFeatureButton(
              icon: Icons.volunteer_activism,
              title: 'Donate',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _primaryColor,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: _textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.search,
                    color: _textSecondary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search alumni, events, jobs...',
                        hintStyle: TextStyle(
                          color: _textSecondary,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(
                    Icons.notifications,
                    color: _textSecondary,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel
          _buildImageCarousel(),
          const SizedBox(height: 20),
          // Feature Buttons
          _buildFeatureGrid(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Add listener to page controller to update current page
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
    // Start auto-scrolling carousel
    _startCarouselTimer();
  }

  void _startCarouselTimer() {
    _carouselTimer?.cancel(); // Cancel any existing timer
    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Get the number of carousel items from the list
      final carouselItemCount =
          4; // Update this if you change the number of items
      if (_currentPage < carouselItemCount - 1) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // If we're at the last page, go back to the first
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopCarouselTimer() {
    _carouselTimer?.cancel();
    _carouselTimer = null;
  }

  void _restartCarouselTimer() {
    _stopCarouselTimer();
    _startCarouselTimer();
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildImageCarousel() {
    // List of carousel items with their titles, descriptions, and images
    final List<Map<String, dynamic>> carouselItems = [
      {
        'title': 'Welcome to',
        'subtitle': 'Alumni Network',
        'description': 'Connect with your classmates',
        'image': 'assets/images/graduation.svg',
        'color': Colors.orange,
      },
      {
        'title': 'Join Our',
        'subtitle': 'Alumni Meetings',
        'description': 'Network with professionals',
        'image': 'assets/images/alumni_meeting.svg',
        'color': Colors.blue.shade700,
      },
      {
        'title': 'Upcoming',
        'subtitle': 'Campus Events',
        'description': 'Stay connected with your alma mater',
        'image': 'assets/images/campus_event.svg',
        'color': Colors.green.shade700,
      },
      {
        'title': 'Expand Your',
        'subtitle': 'Professional Network',
        'description': 'Connect with alumni in your field',
        'image': 'assets/images/networking.svg',
        'color': Colors.purple.shade700,
      },
    ];

    return Column(
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: GestureDetector(
              onPanDown: (_) {
                // Stop the timer when user touches the carousel
                _stopCarouselTimer();
              },
              onPanEnd: (_) {
                // Restart the timer when user stops interacting
                _restartCarouselTimer();
              },
              onPanCancel: () {
                // Restart the timer when interaction is canceled
                _restartCarouselTimer();
              },
              child: PageView.builder(
                controller: _pageController,
                itemCount: carouselItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                // Smooth scrolling physics
                physics: const BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.down,
                itemBuilder: (context, index) {
                  final item = carouselItems[index];
                  return Container(
                    width: double.infinity,
                    color: item['color'],
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['subtitle'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['description'],
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                item['image'],
                                height: 120,
                                placeholderBuilder: (context) => const Icon(
                                  Icons.school,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Carousel Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            carouselItems.length,
            (index) => _buildCarouselIndicator(index == _currentPage, index),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselIndicator(bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: isActive ? 12 : 8,
        height: isActive ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? _primaryColor : Colors.grey.shade300,
        ),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureGridItem(
            icon: Icons.post_add,
            title: 'Post\nDiscussion', // Fixed: multiline string using \n
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFeatureGridItem(
            icon: Icons.work,
            title: 'Post Job',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFeatureGridItem(
            icon: Icons.add_circle_outline,
            title: ' Stories',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildFeatureGridItem(
            icon: Icons.business_center,
            title: 'Jobs',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureGridItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: _textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: _textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: _textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: _primaryColor,
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rani Channamma',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'University, Belagavi',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.person_outline,
                    title: 'Ramesh Sharma',
                    hasEditIcon: true,
                  ),
                  _buildDrawerItem(
                    icon: Icons.info_outline,
                    title: 'About',
                  ),
                  _buildDrawerItem(
                    icon: Icons.people_outline,
                    title: 'Members',
                  ),
                  _buildDrawerItem(
                    icon: Icons.share_outlined,
                    title: 'Network',
                  ),
                  _buildDrawerItem(
                    icon: Icons.work_outline,
                    title: 'Jobs',
                  ),
                  _buildDrawerItem(
                    icon: Icons.school_outlined,
                    title: 'Scholarship',
                  ),
                  _buildDrawerItem(
                    icon: Icons.laptop_mac_outlined,
                    title: 'Office Bearers',
                  ),
                  _buildDrawerItem(
                    icon: Icons.event_outlined,
                    title: 'Events',
                  ),
                  _buildDrawerItem(
                    icon: Icons.description_outlined,
                    title: 'Application',
                  ),
                  _buildDrawerItem(
                    icon: Icons.handshake_outlined,
                    title: 'Training',
                  ),
                  _buildDrawerItem(
                    icon: Icons.call_outlined,
                    title: 'Contact Us',
                  ),
                  _buildDrawerItem(
                    icon: Icons.logout_outlined,
                    title: 'Logout',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    bool hasEditIcon = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: hasEditIcon
              ? const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                )
              : null,
          onTap: () {
            // Handle menu item tap
            Navigator.pop(context);
          },
        ),
        const Divider(
          color: Colors.white24,
          height: 1,
        ),
      ],
    );
  }
}
