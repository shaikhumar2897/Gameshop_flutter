
import 'dart:async';
import 'dart:math';
import 'games.dart' as free_games;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


void main() {
  runApp(GameZoneX());
}

/* ============================================================
   APP
============================================================ */

class GameZoneX extends StatelessWidget {
  GameZoneX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GAMEZONE X',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF080B14),
        primaryColor: Color(0xFF8B5CF6),
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

/* ============================================================
   MODELS
============================================================ */

class Game {
  final String name;
  final String category;
  final double rating;
  final double oldPrice;
  final double price;
  final String image;
  final String developer;
  final String year;
  final String platform;
  final String description;
  final String trailer;

  Game({
    required this.name,
    required this.category,
    required this.rating,
    required this.oldPrice,
    required this.price,
    required this.image,
    required this.developer,
    required this.year,
    required this.platform,
    required this.description,
    required this.trailer,
  });
}

class CartItem {
  final Game game;
  int quantity;

  CartItem({
    required this.game,
    this.quantity = 1,
  });

  double get total => game.price * quantity;
}

class PCSetup {
  final String name;
  final String gpu;
  final String ram;
  final String monitor;
  final String accessories;
  final double price;

  PCSetup({
    required this.name,
    required this.gpu,
    required this.ram,
    required this.monitor,
    required this.accessories,
    required this.price,
  });
}

class Booking {
  final String id;
  final String pc;
  final DateTime date;
  final TimeOfDay time;
  final int duration;
  final double amount;
  String status;

  Booking({
    required this.id,
    required this.pc,
    required this.date,
    required this.time,
    required this.duration,
    required this.amount,
    this.status = 'Upcoming',
  });
}

class Review {
  final String username;
  final double rating;
  final String comment;

  Review({
    required this.username,
    required this.rating,
    required this.comment,
  });
}
class OrderRecord {
  final String id;
  final String email;
  final String username;
  final List<String> games;
  final double amount;
  final String status;
  final DateTime date;

  OrderRecord({
    required this.id,
    required this.email,
    required this.username,
    required this.games,
    required this.amount,
    required this.status,
    required this.date,
  });

}

/* ============================================================
   DATA
============================================================ */

final List<Game> games = [
  Game(
    name: 'GTA V',
    category: 'Action',
    rating: 4.9,
    oldPrice: 2999,
    price: 1499,
    image:
    'https://wallpapers.com/images/featured/grand-theft-auto-v-naej4yiap4gnxh2o.jpg',
    developer: 'Rockstar Games',
    year: '2013',
    platform: 'PC / PlayStation / Xbox',
    description:
    'Experience a massive open-world action adventure filled with missions, vehicles, characters and an enormous city to explore.',
    trailer: 'assets/videos/gta5.mp4',
  ),
  Game(
    name: 'Minecraft',
    category: 'Adventure',
    rating: 4.8,
    oldPrice: 1999,
    price: 999,
    image:
    'https://tse3.mm.bing.net/th/id/OIF.ItfkkyVOoSl2JzQ6NSgIpw?r=0&pid=Api&h=220&P=0',
    developer: 'Mojang Studios',
    year: '2011',
    platform: 'PC / Mobile / Console',
    description:
    'Build, explore and survive in a creative block-based world with endless possibilities.',
    trailer: 'assets/videos/minecraft.mp4',
  ),
  Game(
    name: 'Valorant',
    category: 'FPS',
    rating: 4.7,
    oldPrice: 1499,
    price: 699,
    image:
    'https://tse3.mm.bing.net/th/id/OIP.h05kNp0DdgEdm7MjYcqbbwHaEK?r=0&pid=Api&h=220&P=0',
    developer: 'Riot Games',
    year: '2020',
    platform: 'PC',
    description:
    'A competitive tactical FPS where precise shooting and unique agent abilities decide the match.',
    trailer: 'assets/videos/valorant.mp4',
  ),
  Game(
    name: 'PUBG',
    category: 'Action',
    rating: 4.6,
    oldPrice: 2999,
    price: 1399,
    image:
    'https://tse1.mm.bing.net/th/id/OIP.jarFwnq8wAOMNzXVyI5YQwHaD4?r=0&pid=Api&h=220&P=0',
    developer: 'Ubisoft',
    year: '2020',
    platform: 'PC / Console',
    description:
    'Explore historical worlds, complete missions and experience an action-packed adventure.',
    trailer: 'assets/videos/bgmi.mp4',
  ),
  Game(
    name: 'Forza Horizon 6',
    category: 'Racing',
    rating: 4.9,
    oldPrice: 3999,
    price: 2199,
    image:
    'https://cdn.forza.net/strapi-uploads/assets/Forza_Horizon_6_3840x2160_Hori_Final_ac7b0063ff.jpg',
    developer: 'Playground Games',
    year: '2021',
    platform: 'PC / Xbox',
    description:
    'Race across a beautiful open world with hundreds of cars and intense racing events.',
    trailer: 'assets/videos/forza.mp4',
  ),
  Game(
    name: 'Red Dead Redemption 2',
    category: 'Adventure',
    rating: 4.9,
    oldPrice: 3999,
    price: 2499,
    image:
    'https://tse2.mm.bing.net/th/id/OIP.Kp6-H37iAhAlVb4gLVYy7AHaEK?r=0&pid=Api&h=220&P=0',
    developer: 'Rockstar Games',
    year: '2018',
    platform: 'PC / PlayStation / Xbox',
    description:
    'Explore a huge western world filled with story missions, characters and adventures.',
    trailer: 'assets/videos/rdr2.mp4',
  ),
  Game(
    name: 'Cyberpunk 2077',
    category: 'RPG',
    rating: 4.5,
    oldPrice: 3999,
    price: 1799,
    image:
    'https://tse1.mm.bing.net/th/id/OIP.rptuJYpLz18yNc40qa3MIwHaEK?r=0&pid=Api&h=220&P=0',
    developer: 'CD Projekt Red',
    year: '2020',
    platform: 'PC / PlayStation / Xbox',
    description:
    'Explore a futuristic city filled with technology, missions and a deep RPG experience.',
    trailer: 'assets/videos/cyberpunk.mp4',
  ),
  Game(
    name: 'Devil may cry 5',
    category: 'FPS',
    rating: 4.7,
    oldPrice: 2999,
    price: 1599,
    image:
    'https://tse2.mm.bing.net/th/id/OIP.yNBFb_1riVo7MZibIMpL-wHaEK?r=0&pid=Api&h=220&P=0',
    developer: 'Activision',
    year: '2023',
    platform: 'PC / PlayStation / Xbox',
    description:
    'Jump into fast-paced combat with competitive multiplayer and exciting missions.',
    trailer: 'assets/videos/devil.mp4',
  ),
  Game(
    name: 'Need for Speed',
    category: 'Racing',
    rating: 4.4,
    oldPrice: 2499,
    price: 1199,
    image:
    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=900',
    developer: 'Electronic Arts',
    year: '2022',
    platform: 'PC / Console',
    description:
    'Customize powerful cars and compete in exciting street racing events.',
    trailer: 'assets/videos/nfs.mp4',
  ),
  Game(
    name: 'EA Sports FC',
    category: 'Sports',
    rating: 4.6,
    oldPrice: 3499,
    price: 1999,
    image:
    'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=900',
    developer: 'EA Sports',
    year: '2023',
    platform: 'PC / PlayStation / Xbox',
    description:
    'Build your football dream team and experience realistic football gameplay.',
    trailer: 'assets/videos/fc24.mp4',
  ),

];

final List<PCSetup> pcSetups = [
  PCSetup(
    name: 'Standard',
    gpu: 'RTX 3060',
    ram: '16 GB',
    monitor: '144 Hz',
    accessories: 'Keyboard + Mouse',
    price: 80,
  ),
  PCSetup(
    name: 'Pro',
    gpu: 'RTX 4070',
    ram: '32 GB',
    monitor: '240 Hz',
    accessories: 'Mechanical Keyboard + Mouse + Headset',
    price: 150,
  ),
  PCSetup(
    name: 'Ultra',
    gpu: 'RTX 4080',
    ram: '32 GB',
    monitor: '360 Hz',
    accessories: 'Premium Chair + Keyboard + Mouse + Headset',
    price: 220,
  ),
];

final List<Review> reviews = [
  Review(
    username: 'Rahul',
    rating: 5,
    comment: 'Amazing gaming experience and very smooth interface!',
  ),
  Review(
    username: 'Ayaan',
    rating: 4.5,
    comment: 'The PC booking system is very convenient.',
  ),
  Review(
    username: 'Rohan',
    rating: 5,
    comment: 'Great game collection and excellent discounts.',
  ),
];

/* ============================================================
   GLOBAL APP STATE
============================================================ */

class AppState {
  static final List<CartItem> cart = [];
  static final List<Game> wishlist = [];
  static final List<Booking> bookings = [];

  // ==========================================================
  // ORDERS
  // ==========================================================

  static final List<OrderRecord> orders = [];

  // ==========================================================
  // CURRENT USER ORDERS
  // ==========================================================

  static List<OrderRecord> get currentUserOrders {
    final String currentEmail =
    AuthState.email.trim().toLowerCase();

    if (currentEmail.isEmpty) {
      return [];
    }

    return orders
        .where(
          (order) =>
      order.email.trim().toLowerCase() ==
          currentEmail,
    )
        .toList()
        .reversed
        .toList();
  }

  // ==========================================================
  // CART TOTAL
  // ==========================================================

  static double get cartTotal {
    double total = 0;

    for (final item in cart) {
      total += item.total;
    }

    return total;
  }

  // ==========================================================
  // CART COUNT
  // ==========================================================

  static int get cartCount {
    int count = 0;

    for (final item in cart) {
      count += item.quantity;
    }

    return count;
  }
}

/* ============================================================
   LOGIN / AUTHENTICATION
============================================================ */

class AuthState {
  static String username = '';
  static String email = '';

  static void login({
    required String username,
    required String email,
  }) {
    AuthState.username = username;
    AuthState.email = email;
  }

  static void logout() {
    username = '';
    email = '';
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  String? errorText;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    scaleAnimation = Tween<double>(
      begin: .92,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutBack,
      ),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void login() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty) {
      setState(() => errorText = 'Enter your gamer name.');
      return;
    }

    if (email.isEmpty ||
        !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      setState(() => errorText = 'Enter a valid Gmail address.');
      return;
    }

    if (password.isEmpty) {
      setState(() => errorText = 'Enter your password.');
      return;
    }

    if (password.length < 6) {
      setState(() => errorText = 'Password must be at least 6 characters.');
      return;
    }

    AuthState.login(
      username: username,
      email: email,
    );

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => MainScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF050611),
              Color(0xFF17112F),
              Color(0xFF071C2D),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: ScaleTransition(
                scale: scaleAnimation,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 430),
                  child: Container(
                    padding: EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      color: Color(0xFF101321),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color(0xFF8B5CF6),
                        width: 1.3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF8B5CF6).withOpacity(.18),
                          blurRadius: 35,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF8B5CF6),
                                Color(0xFF06B6D4),
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.sports_esports_rounded,
                            size: 44,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          'GAMEZONE X',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'WELCOME GAMER',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 25),
                        _loginField(
                          usernameController,
                          'Gamer name',
                          Icons.person_rounded,
                        ),
                        SizedBox(height: 14),
                        _loginField(
                          emailController,
                          'Gmail address',
                          Icons.email_rounded,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 14),
                        _loginField(
                          passwordController,
                          'Password',
                          Icons.lock_rounded,
                          obscureText: !showPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() => showPassword = !showPassword);
                            },
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                        ),
                        if (errorText != null) ...[
                          SizedBox(height: 14),
                          Text(
                            errorText!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF87171),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton.icon(
                            onPressed: login,
                            icon: Icon(Icons.login_rounded),
                            label: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                letterSpacing: .7,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8B5CF6),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 17),
                        Text(
                          'Enter your gamer name, Gmail and password to continue.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginField(
      TextEditingController controller,
      String label,
      IconData icon, {
        TextInputType? keyboardType,
        bool obscureText = false,
        Widget? suffixIcon,
      }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xFF080B14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(color: Color(0xFF24283A)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(color: Color(0xFF24283A)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(
            color: Color(0xFF8B5CF6),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

/* ============================================================
   MAIN SCREEN
============================================================ */

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        onDiscover: () => setState(() => selectedIndex = 1),
        onCinema: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CinemaPage()),
          );
        },
        onStudio: () => setState(() => selectedIndex = 3),
        onRefresh: refresh,
      ),

      ShopPage(onRefresh: refresh),


      free_games.HomePage(),

      StudioPage(onRefresh: refresh),

      CartPage(onRefresh: refresh),

      ProfilePage(onRefresh: refresh),
    ];
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation() {
    final items = [
      [Icons.home_rounded, 'Home'],
      [Icons.storefront_rounded, 'Shop'],
      [Icons.games_rounded, 'Games'],
      [Icons.computer_rounded, 'Studio'],
      [Icons.shopping_cart_rounded, 'Cart'],
      [Icons.person_rounded, 'Profile'],
    ];

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0B0E18),
        border: Border(
          top: BorderSide(color: Color(0xFF252A3D)),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final active = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 220),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: active
                        ? LinearGradient(
                      colors: [
                        Color(0xFF8B5CF6),
                        Color(0xFF06B6D4),
                      ],
                    )
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[index][0] as IconData,
                        size: 20,
                        color: active
                            ? Colors.white
                            : Colors.white54,
                      ),
                      if (active) ...[
                        SizedBox(width: 6),
                        Text(
                          items[index][1] as String,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/* ============================================================
   HOME PAGE - GAMING DISCOVERY HUB
============================================================ */

class HomePage extends StatelessWidget {
  final VoidCallback onDiscover;
  final VoidCallback onCinema;
  final VoidCallback onStudio;
  final VoidCallback onRefresh;

  HomePage({
    super.key,
    required this.onDiscover,
    required this.onCinema,
    required this.onStudio,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final game = games[6];

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Simple header
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF7C3AED),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text('🎮', style: TextStyle(fontSize: 25)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GAMEZONE X',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome, ${AuthState.username.isEmpty ? 'Gamer' : AuthState.username}',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CartPage()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),

            SizedBox(height: 25),

            // Simple welcome section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color(0xFF151927),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WELCOME TO GAMEZONE',
                    style: TextStyle(
                      color: Color(0xFF67E8F9),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Play. Discover. Enjoy.',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Find your favourite games in one place.',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text(
              'Game Categories',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // Simple category buttons
            Row(
              children: [
                Expanded(child: _categoryButton('FPS', Icons.gps_fixed, onDiscover)),
                SizedBox(width: 10),
                Expanded(child: _categoryButton('Racing', Icons.directions_car, onDiscover)),
                SizedBox(width: 10),
                Expanded(child: _categoryButton('RPG', Icons.shield, onDiscover)),
              ],
            ),

            SizedBox(height: 25),

            Text(
              'Game of the Day',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // Simple game card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GameDetailsPage(
                      game: game,
                      onChanged: onRefresh,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF151927),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        game.image,
                        width: 110,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 110,
                          height: 100,
                          color: Color(0xFF252A3D),
                          child: Icon(Icons.games, size: 35),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            game.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            game.category,
                            style: TextStyle(
                              color: Color(0xFF67E8F9),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '₹${game.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),

            // Simple action buttons
            Row(
              children: [
                Expanded(
                  child: _actionButton(
                    'Cinema',
                    Icons.movie_outlined,
                    onCinema,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _actionButton(
                    'PC Studio',
                    Icons.computer_outlined,
                    onStudio,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Color(0xFF151927),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color(0xFF292F46)),
        ),
        child: Column(
          children: [
            Icon(icon, color: Color(0xFF67E8F9), size: 25),
            SizedBox(height: 7),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0xFF151927),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color(0xFF292F46)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Color(0xFF8B5CF6)),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   DISCOVER PAGE
============================================================ */

class DiscoverPage extends StatefulWidget {
  final VoidCallback onRefresh;
  DiscoverPage({super.key, required this.onRefresh});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String category = 'All';
  final categories = ['All', 'Action', 'Adventure', 'Racing', 'RPG', 'FPS', 'Sports'];

  @override
  Widget build(BuildContext context) {
    final filtered = category == 'All' ? games : games.where((g) => g.category == category).toList();
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(18, 18, 18, 8),
          child: Row(children: [
            Expanded(child: PageHeader(title: 'Discover', subtitle: 'Explore games by mood and genre')),
            Stack(children: [
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage())), icon: Icon(Icons.shopping_cart_outlined)),
              if (AppState.cartCount > 0) Positioned(right: 5, top: 3, child: CircleAvatar(radius: 8, backgroundColor: Colors.redAccent, child: Text('${AppState.cartCount}', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)))),
            ]),
          ]),
        ),
        SizedBox(
          height: 42,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 8),
            itemBuilder: (_, i) {
              final selected = category == categories[i];
              return ChoiceChip(label: Text(categories[i]), selected: selected, onSelected: (_) => setState(() => category = categories[i]), selectedColor: Color(0xFF7C3AED), backgroundColor: Color(0xFF151927), labelStyle: TextStyle(color: selected ? Colors.white : Colors.white60, fontWeight: FontWeight.w700, fontSize: 11));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(18),
          child: Row(children: [
            Expanded(child: _discoverAction(context, Icons.storefront_rounded, 'GAME SHOP', 'Buy & wishlist', () => Navigator.push(context, MaterialPageRoute(builder: (_) => ShopPage(onRefresh: widget.onRefresh))))),
            SizedBox(width: 10),
            Expanded(child: _discoverAction(context, Icons.compare_arrows_rounded, 'GAME BATTLE', 'Compare two games', () => Navigator.push(context, MaterialPageRoute(builder: (_) => GameBattlePage())))),
          ]),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.fromLTRB(18, 0, 18, 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .72),
            itemCount: filtered.length,
            itemBuilder: (_, i) => GameCard(game: filtered[i], onChanged: widget.onRefresh),
          ),
        ),
      ]),
    );
  }

  Widget _discoverAction(BuildContext context, IconData icon, String title, String subtitle, VoidCallback tap) {
    return GestureDetector(onTap: tap, child: Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Color(0xFF151927), borderRadius: BorderRadius.circular(18), border: Border.all(color: Color(0xFF292F46))), child: Row(children: [Icon(icon, color: Color(0xFF67E8F9), size: 25), SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 11)), Text(subtitle, style: TextStyle(color: Colors.white38, fontSize: 9))]))])));
  }
}

/* ============================================================
   CINEMA PAGE
============================================================ */

class CinemaPage extends StatelessWidget {
  CinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080A12),

      appBar: AppBar(
        backgroundColor: Color(0xFF0D0F18),
        elevation: 0,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).popUntil(
                  (route) => route.isFirst,
            );
          },
        ),

        title: Text(
          'Gaming Cinema',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(18, 18, 18, 25),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PageHeader(title: 'Gaming Cinema', subtitle: 'Trailers, worlds and stories'),
            SizedBox(height: 20),
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), gradient: LinearGradient(colors: [Color(0xFF312E81), Color(0xFF0E7490)])),
              child: Stack(children: [
                Positioned(right: 18, top: 20, child: Icon(Icons.movie_filter_rounded, size: 105, color: Color(0x228B5CF6))),
                Padding(padding: EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text('🎬 GAMING CINEMA', style: TextStyle(color: Color(0xFF67E8F9), fontSize: 10, fontWeight: FontWeight.w900)), SizedBox(height: 9), Text('Watch the world\nbefore you enter it.', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, height: 1.05)), SizedBox(height: 8), Text('Select a game below to explore its details.', style: TextStyle(color: Colors.white60, fontSize: 11))])),
              ]),
            ),
            SizedBox(height: 25),
            SectionTitle(title: 'Featured Trailers', subtitle: 'Tap a title to explore the game'),
            SizedBox(height: 14),
            ...games.take(6).map((game) => _trailerCard(context, game)),
          ]),
        ), ),
    );
  }

  Widget _trailerCard(BuildContext context, Game game) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GameDetailsPage(game: game))),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 112,
        decoration: BoxDecoration(color: Color(0xFF151927), borderRadius: BorderRadius.circular(19), border: Border.all(color: Color(0xFF292F46))),
        clipBehavior: Clip.antiAlias,
        child: Row(children: [
          SizedBox(width: 150, height: double.infinity, child: Stack(fit: StackFit.expand, children: [Image.network(game.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: Color(0xFF252B3D))), Container(color: Colors.black38), Center(child: CircleAvatar(radius: 21, backgroundColor: Color(0xCC8B5CF6), child: Icon(Icons.play_arrow_rounded, color: Colors.white)))])),
          SizedBox(width: 13),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(game.name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)), SizedBox(height: 5), Text('${game.category} • ${game.year}', style: TextStyle(color: Colors.white54, fontSize: 10)), SizedBox(height: 7), Text('▶  Watch trailer', style: TextStyle(color: Color(0xFF67E8F9), fontSize: 10, fontWeight: FontWeight.w800))])),
        ]),
      ),
    );
  }
}

/* ============================================================
   GAME FINDER
============================================================ */

class GameFinderPage extends StatefulWidget {
  GameFinderPage({super.key});
  @override
  State<GameFinderPage> createState() => _GameFinderPageState();
}

class _GameFinderPageState extends State<GameFinderPage> {
  int step = 0;
  String style = 'Open World';
  String pace = 'Story';
  String platform = 'PC';

  void next() {
    if (step < 2) {
      setState(() => step++);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FinderResultPage(style: style, pace: pace, platform: platform)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      ['What world do you want?', ['Open World', 'Competitive', 'Fantasy', 'Realistic']],
      ['How do you want to play?', ['Story', 'Fast', 'Relaxed', 'Strategic']],
      ['Where do you play?', ['PC', 'Console', 'Mobile', 'Any']],
    ];
    final values = [style, pace, platform];
    return Scaffold(appBar: AppBar(title: Text('Find Your Game')), body: Padding(padding: EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('QUESTION ${step + 1} OF 3', style: TextStyle(color: Color(0xFF67E8F9), fontWeight: FontWeight.w900, fontSize: 11)), SizedBox(height: 14), Text(questions[step][0] as String, style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900)), SizedBox(height: 25), ...(questions[step][1] as List<String>).map((option) => Padding(padding: EdgeInsets.only(bottom: 12), child: GestureDetector(onTap: () => setState(() { if (step == 0) style = option; if (step == 1) pace = option; if (step == 2) platform = option; }), child: Container(width: double.infinity, padding: EdgeInsets.all(18), decoration: BoxDecoration(color: values[step] == option ? Color(0xFF312E81) : Color(0xFF151927), borderRadius: BorderRadius.circular(17), border: Border.all(color: values[step] == option ? Color(0xFF8B5CF6) : Color(0xFF292F46))), child: Row(children: [Icon(values[step] == option ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, color: values[step] == option ? Color(0xFF67E8F9) : Colors.white38), SizedBox(width: 12), Text(option, style: TextStyle(fontWeight: FontWeight.w800))]))))), Spacer(), SizedBox(width: double.infinity, height: 53, child: ElevatedButton(onPressed: next, child: Text(step == 2 ? 'SHOW MY GAMES' : 'CONTINUE', style: TextStyle(fontWeight: FontWeight.w900))))])));
  }
}

class FinderResultPage extends StatelessWidget {
  final String style;
  final String pace;
  final String platform;
  FinderResultPage({super.key, required this.style, required this.pace, required this.platform});

  @override
  Widget build(BuildContext context) {
    List<Game> result = games.where((g) {
      final matchStyle = style == 'Open World' ? ['Action', 'Adventure', 'RPG'].contains(g.category) : style == 'Competitive' ? g.category == 'FPS' : style == 'Fantasy' ? ['RPG', 'Adventure'].contains(g.category) : true;
      final matchPace = pace == 'Fast' ? ['FPS', 'Racing', 'Action'].contains(g.category) : pace == 'Strategic' ? ['RPG', 'Sports'].contains(g.category) : true;
      return matchStyle && matchPace;
    }).take(4).toList();
    if (result.isEmpty) result = games.take(4).toList();
    return Scaffold(appBar: AppBar(title: Text('Your Matches')), body: SingleChildScrollView(padding: EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('YOUR GAMING STYLE', style: TextStyle(color: Color(0xFF67E8F9), fontSize: 10, fontWeight: FontWeight.w900)), SizedBox(height: 6), Text(style, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)), Text('$pace • $platform', style: TextStyle(color: Colors.white54)), SizedBox(height: 22), Text('Recommended for you', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), SizedBox(height: 14), ...result.map((g) => _resultCard(context, g))])));
  }

  Widget _resultCard(BuildContext context, Game g) => GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GameDetailsPage(game: g))), child: Container(margin: EdgeInsets.only(bottom: 12), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF151927), borderRadius: BorderRadius.circular(18)), child: Row(children: [ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(g.image, width: 90, height: 70, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 90, height: 70, color: Color(0xFF252B3D)))), SizedBox(width: 13), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(g.name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)), Text(g.category, style: TextStyle(color: Colors.white54, fontSize: 10)), SizedBox(height: 5), Row(children: [Icon(Icons.star_rounded, color: Colors.amber, size: 15), SizedBox(width: 3), Text(g.rating.toString(), style: TextStyle(fontSize: 10))])])), Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.white38)])));
}

/* ============================================================
   GAME BATTLE
============================================================ */

class GameBattlePage extends StatefulWidget {
  GameBattlePage({super.key});
  @override
  State<GameBattlePage> createState() => _GameBattlePageState();
}

class _GameBattlePageState extends State<GameBattlePage> {
  Game left = games[0];
  Game right = games[5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Game Battle')), body: SingleChildScrollView(padding: EdgeInsets.all(18), child: Column(children: [Text('CHOOSE TWO GAMES', style: TextStyle(color: Color(0xFF67E8F9), fontSize: 10, fontWeight: FontWeight.w900)), SizedBox(height: 18), Row(children: [Expanded(child: _gameSelector(true)), Padding(padding: EdgeInsets.symmetric(horizontal: 9), child: Text('VS', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white54))), Expanded(child: _gameSelector(false))]), SizedBox(height: 22), _stat('Rating', left.rating, right.rating), _stat('Price', left.price, right.price, lowerIsBetter: true), _stat('Open World', _openWorld(left), _openWorld(right)), _stat('Story', _story(left), _story(right)), SizedBox(height: 18), Text('This is a feature comparison — you decide which fits you.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, fontSize: 10))])));
  }

  double _openWorld(Game g) => ['GTA V', 'Red Dead Redemption 2', 'Cyberpunk 2077', 'Minecraft'].contains(g.name) ? 5 : 3;
  double _story(Game g) => ['Red Dead Redemption 2', 'Cyberpunk 2077', 'GTA V'].contains(g.name) ? 5 : 3.5;

  Widget _gameSelector(bool isLeft) {
    final current = isLeft ? left : right;
    return GestureDetector(onTap: () async {
      final selected = await showModalBottomSheet<Game>(context: context, backgroundColor: Color(0xFF101321), builder: (_) => ListView(padding: EdgeInsets.all(18), children: games.map((g) => ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(g.image)), title: Text(g.name), subtitle: Text(g.category), onTap: () => Navigator.pop(context, g))).toList()));
      if (selected != null) setState(() { if (isLeft) left = selected; else right = selected; });
    }, child: Column(children: [ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(current.image, height: 95, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 95, color: Color(0xFF252B3D)))), SizedBox(height: 7), Text(current.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 11))]));
  }

  Widget _stat(String title, double a, double b, {bool lowerIsBetter = false}) {
    return Container(margin: EdgeInsets.only(bottom: 10), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Color(0xFF151927), borderRadius: BorderRadius.circular(15)), child: Row(children: [Expanded(child: Text(a == a.roundToDouble() ? a.toInt().toString() : a.toStringAsFixed(1), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900))), Expanded(child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.w700))), Expanded(child: Text(b == b.roundToDouble() ? b.toInt().toString() : b.toStringAsFixed(1), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)))]));
  }
}

/* ============================================================
   COMMUNITY
============================================================ */

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key});
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<Review> localReviews = [...reviews];
  double selectedRating = 5;
  final controller = TextEditingController();

  @override
  void dispose() { controller.dispose(); super.dispose(); }

  void addReview() {
    if (controller.text.trim().isEmpty) return;
    setState(() { localReviews.insert(0, Review(username: AuthState.username.isEmpty ? 'Gamer' : AuthState.username, rating: selectedRating, comment: controller.text.trim())); controller.clear(); });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Review added to the community.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Community')), body: ListView(padding: EdgeInsets.all(18), children: [Container(padding: EdgeInsets.all(18), decoration: BoxDecoration(color: Color(0xFF151927), borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('WRITE A REVIEW', style: TextStyle(color: Color(0xFF67E8F9), fontSize: 10, fontWeight: FontWeight.w900)), SizedBox(height: 10), Row(children: List.generate(5, (i) => IconButton(onPressed: () => setState(() => selectedRating = i + 1.0), icon: Icon(Icons.star_rounded, color: i < selectedRating ? Colors.amber : Colors.white24)))), TextField(controller: controller, maxLines: 3, decoration: InputDecoration(hintText: 'Share your gaming experience...', filled: true, fillColor: Color(0xFF0D101C), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none))), SizedBox(height: 10), SizedBox(width: double.infinity, child: ElevatedButton(onPressed: addReview, child: Text('POST REVIEW')))])), SizedBox(height: 22), Text('GAMER REVIEWS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), SizedBox(height: 12), ...localReviews.map((r) => Container(margin: EdgeInsets.only(bottom: 10), padding: EdgeInsets.all(15), decoration: BoxDecoration(color: Color(0xFF151927), borderRadius: BorderRadius.circular(17)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [CircleAvatar(radius: 15, child: Text(r.username.isEmpty ? 'G' : r.username[0].toUpperCase())), SizedBox(width: 9), Expanded(child: Text(r.username, style: TextStyle(fontWeight: FontWeight.w800))), Text('⭐ ${r.rating} ', style: TextStyle(color: Colors.amber, fontSize: 11))]), SizedBox(height: 9), Text(r.comment, style: TextStyle(color: Colors.white70, fontSize: 12))]))) ]));
  }
}

/* ============================================================
   SHOP PAGE
============================================================ */

class ShopPage extends StatefulWidget {
  final VoidCallback? onRefresh;

  ShopPage({
    super.key,
    this.onRefresh,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController searchController =
  TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Action',
    'Adventure',
    'Racing',
    'Sports',
    'RPG',
    'FPS',
    'Strategy',
  ];

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final search = searchController.text.trim().toLowerCase();

    final filtered = games.where((game) {
      final matchesSearch =
          game.name.toLowerCase().contains(search) ||
              game.category.toLowerCase().contains(search);

      final matchesCategory =
          selectedCategory == 'All' ||
              game.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Game Shop',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.6,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Discover your next adventure',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Color(0xFF151927),
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          searchFocusNode.requestFocus();
                        },
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.white70,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  onChanged: (_) => setState(() {}),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search games...',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.white70,
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        setState(() {});
                      },
                      icon: Icon(Icons.close_rounded),
                    )
                        : null,
                    filled: true,
                    fillColor: Color(0xFF151927),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Color(0xFF8B5CF6),
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: 9),
                    itemBuilder: (_, index) {
                      final category = categories[index];
                      final selected = category == selectedCategory;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: selected
                                ? LinearGradient(
                              colors: [
                                Color(0xFF8B5CF6),
                                Color(0xFF06B6D4),
                              ],
                            )
                                : null,
                            color: selected
                                ? null
                                : Color(0xFF151927),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: selected
                                  ? Colors.white
                                  : Colors.white60,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: filtered.isEmpty
                ? EmptyState(
              icon: Icons.search_off_rounded,
              title: 'No games found',
              message: 'Try another game name or category.',
            )
                : LayoutBuilder(
              builder: (context, constraints) {
                int columns = 2;

                if (constraints.maxWidth >= 1350) {
                  columns = 4;
                } else if (constraints.maxWidth >= 900) {
                  columns = 3;
                }

                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    12,
                    20,
                    24,
                  ),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 430,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (_, index) {
                    return GameCard(
                      game: filtered[index],
                      onChanged: () {
                        setState(() {});
                        widget.onRefresh?.call();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   GAME CARD
============================================================ */

class GameCard extends StatefulWidget {
  final Game game;
  final VoidCallback? onChanged;

  GameCard({
    super.key,
    required this.game,
    this.onChanged,
  });

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool pressed = false;

  int get discount {
    return ((widget.game.oldPrice - widget.game.price) /
        widget.game.oldPrice *
        100)
        .round();
  }

  void addToCart() {
    final existing = AppState.cart.where(
          (item) => item.game.name == widget.game.name,
    );

    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      AppState.cart.add(
        CartItem(game: widget.game),
      );
    }

    widget.onChanged?.call();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.game.name} added to cart'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'VIEW CART',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartPage(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wishlisted = AppState.wishlist.contains(widget.game);

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          pressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          pressed = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GameDetailsPage(
              game: widget.game,
              onChanged: widget.onChanged,
            ),
          ),
        );
      },
      onTapCancel: () {
        setState(() {
          pressed = false;
        });
      },
      child: AnimatedScale(
        scale: pressed ? 0.97 : 1,
        duration: Duration(milliseconds: 120),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF131724),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Color(0xFF252A3D),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.game.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: Color(0xFF202538),
                          child: Icon(
                            Icons.videogame_asset_rounded,
                            size: 50,
                            color: Colors.white30,
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius:
                          BorderRadius.circular(9),
                        ),
                        child: Text(
                          '-$discount%',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (wishlisted) {
                              AppState.wishlist
                                  .remove(widget.game);
                            } else {
                              AppState.wishlist
                                  .add(widget.game);
                            }
                          });

                          widget.onChanged?.call();
                        },
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                          child: Icon(
                            wishlisted
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: wishlisted
                                ? Colors.redAccent
                                : Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.game.category.toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFF06B6D4),
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.game.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          Text(
                            widget.game.rating.toString(),
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            '₹${widget.game.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '₹${widget.game.oldPrice.toStringAsFixed(0)}',
                            style: TextStyle(
                              decoration:
                              TextDecoration.lineThrough,
                              color: Colors.white30,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: addToCart,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Color(0xFF8B5CF6),
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    'ADD',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight:
                                      FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              height: 36,
                              width: 38,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          GameDetailsPage(
                                            game: widget.game,
                                            onChanged:
                                            widget.onChanged,
                                          ),
                                    ),
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                  Color(0xFF24283A),
                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ============================================================
   GAME DETAILS
============================================================ */

class GameDetailsPage extends StatefulWidget {
  final Game game;
  final VoidCallback? onChanged;

  GameDetailsPage({
    super.key,
    required this.game,
    this.onChanged,
  });

  @override
  State<GameDetailsPage> createState() =>
      _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  void addToCart() {
    final existing = AppState.cart.where(
          (item) => item.game.name == widget.game.name,
    );

    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      AppState.cart.add(
        CartItem(game: widget.game),
      );
    }

    widget.onChanged?.call();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Game added to cart'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final wishlisted =
    AppState.wishlist.contains(widget.game);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Game Details',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (wishlisted) {
                  AppState.wishlist.remove(widget.game);
                } else {
                  AppState.wishlist.add(widget.game);
                }
              });
            },
            icon: Icon(
              wishlisted
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: wishlisted
                  ? Colors.redAccent
                  : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          18,
          5,
          18,
          30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.game.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: Color(0xFF202538),
                      child: Icon(
                        Icons.videogame_asset_rounded,
                        size: 70,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.game.name,
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                RatingBadge(
                  rating: widget.game.rating,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.game.category,
              style: TextStyle(
                color: Color(0xFF06B6D4),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _infoGrid(),
            SizedBox(height: 25),
            Text(
              'About the Game',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.game.description,
              style: TextStyle(
                color: Colors.white60,
                height: 1.6,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Trailer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 12),
            GameTrailer(
              videoPath: widget.game.trailer,
            ),
            SizedBox(height: 25),
            Text(
              'System Requirements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 12),
            _requirements(),
            SizedBox(height: 25),


            _priceSection(),


// PLAY G
            SizedBox(height: 12),

            GradientButton(
              title: 'BUY NOW',
              icon: Icons.flash_on_rounded,
              onTap: () {
                addToCart();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckoutPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: addToCart,
              style: OutlinedButton.styleFrom(
                minimumSize:
                Size(double.infinity, 55),
                side: BorderSide(
                  color: Color(0xFF353A51),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: Icon(
                Icons.add_shopping_cart_rounded,
              ),
              label: Text(
                'ADD TO CART',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            _reviewsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _infoGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.7,
      children: [
        InfoTile(
          icon: Icons.business_rounded,
          title: 'Developer',
          value: widget.game.developer,
        ),
        InfoTile(
          icon: Icons.calendar_month_rounded,
          title: 'Release',
          value: widget.game.year,
        ),
        InfoTile(
          icon: Icons.devices_rounded,
          title: 'Platform',
          value: widget.game.platform,
        ),
        InfoTile(
          icon: Icons.category_rounded,
          title: 'Genre',
          value: widget.game.category,
        ),
      ],
    );
  }

  Widget _requirements() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0xFF272B3E),
        ),
      ),
      child: Column(
        children: [
          RequirementRow(
            title: 'Operating System',
            value: 'Windows 10 / 11',
          ),
          RequirementRow(
            title: 'Processor',
            value: 'Intel Core i5 / Ryzen 5',
          ),
          RequirementRow(
            title: 'RAM',
            value: '16 GB',
          ),
          RequirementRow(
            title: 'Graphics',
            value: 'GTX 1660 / RTX 3060',
          ),
          RequirementRow(
            title: 'Storage',
            value: '100 GB available',
          ),
        ],
      ),
    );
  }

  Widget _priceSection() {
    final discount =
    ((widget.game.oldPrice - widget.game.price) /
        widget.game.oldPrice *
        100)
        .round();

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xFF161B2B),
            Color(0xFF20233B),
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '₹${widget.game.price.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '₹${widget.game.oldPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: Colors.white30,
                        decoration:
                        TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Save $discount%',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.verified_rounded,
            color: Colors.greenAccent,
            size: 35,
          ),
        ],
      ),
    );
  }

  Widget _reviewsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ReviewsPage(),
                    ),
                  );
                },
                child: Text('VIEW ALL'),
              ),
            ],
          ),
          SizedBox(height: 8),
          ...reviews.take(2).map(
                (review) => Padding(
              padding:
              EdgeInsets.only(bottom: 14),
              child: ReviewTile(review: review),
            ),
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   TRAILER PLAYER
============================================================ */

class GameTrailer extends StatefulWidget {
  final String videoPath;

  GameTrailer({
    super.key,
    required this.videoPath,
  });

  @override
  State<GameTrailer> createState() =>
      _GameTrailerState();
}

class _GameTrailerState extends State<GameTrailer> {
  late VideoPlayerController controller;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(
      widget.videoPath,
    )
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            initialized = true;
          });
        }
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.black,
        child: initialized
            ? Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio:
              controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                });
              },
              child: AnimatedContainer(
                duration:
                Duration(milliseconds: 200),
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.65),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white38,
                  ),
                ),
                child: Icon(
                  controller.value.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 35,
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 8,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Color(0xFF8B5CF6),
                  bufferedColor: Colors.white30,
                  backgroundColor: Colors.white12,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          FullScreenVideo(
                            controller: controller,
                          ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.fullscreen_rounded,
                ),
              ),
            ),
          ],
        )
            : AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class FullScreenVideo extends StatelessWidget {
  final VideoPlayerController controller;

  FullScreenVideo({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8B5CF6),
        onPressed: () {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: Icon(
          controller.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}

/* ============================================================
   STUDIO PAGE
============================================================ */

class StudioPage extends StatefulWidget {
  final VoidCallback? onRefresh;

  StudioPage({
    super.key,
    this.onRefresh,
  });

  @override
  State<StudioPage> createState() =>
      _StudioPageState();
}

class _StudioPageState extends State<StudioPage> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    final pc = pcSetups[selected];

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Game Studio',
              subtitle:
              'Premium gaming PCs. Maximum performance.',
            ),
            SizedBox(height: 20),
            _studioHero(),
            SizedBox(height: 25),
            Text(
              'Choose Your Setup',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 14),
            ...List.generate(
              pcSetups.length,
                  (index) {
                return Padding(
                  padding:
                  EdgeInsets.only(bottom: 12),
                  child: PCSetupCard(
                    setup: pcSetups[index],
                    selected: selected == index,
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF131724),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.timer_rounded,
                    color: Color(0xFF06B6D4),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Hourly Gaming',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '₹${pc.price.toStringAsFixed(0)}/hour',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            GradientButton(
              title: 'BOOK ${pc.name.toUpperCase()} PC',
              icon: Icons.calendar_month_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingPage(
                      setup: pc,
                      onBooked: () {
                        widget.onRefresh?.call();
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 25),
            Text(
              'Studio Features',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 15),
            FeatureGrid(),
          ],
        ),
      ),
    );
  }

  Widget _studioHero() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Color(0xFF312E81),
            Color(0xFF0E7490),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.computer_rounded,
            size: 50,
          ),
          SizedBox(height: 15),
          Text(
            'PLAY WITHOUT LIMITS',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'High-performance PCs, high refresh-rate monitors and premium gaming peripherals.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   BOOKING PAGE
============================================================ */

class BookingPage extends StatefulWidget {
  final PCSetup setup;
  final VoidCallback? onBooked;

  BookingPage({
    super.key,
    required this.setup,
    this.onBooked,
  });

  @override
  State<BookingPage> createState() =>
      _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int duration = 1;

  double get total =>
      widget.setup.price * duration;

  Future<void> chooseDate() async {
    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(
        Duration(days: 90),
      ),
      initialDate: now,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
            ),
          ),
          child: child ?? SizedBox.shrink(),
        );
      },
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> chooseTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  void confirmBooking() {
    final date = selectedDate;
    final time = selectedTime;

    if (date == null || time == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please select date and time.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final random = Random();
    final id =
        'GZX-${10000 + random.nextInt(89999)}';

    final booking = Booking(
      id: id,
      pc: widget.setup.name,
      date: date,
      time: time,
      duration: duration,
      amount: total,
    );

    AppState.bookings.add(booking);

    widget.onBooked?.call();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            BookingConfirmationPage(
              booking: booking,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Gaming PC',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            PCSetupCard(
              setup: widget.setup,
              selected: true,
              onTap: () {},
            ),
            SizedBox(height: 25),
            Text(
              'Select Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            SelectBox(
              icon: Icons.calendar_month_rounded,
              text: selectedDate == null
                  ? 'Choose date'
                  : '${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}',
              onTap: chooseDate,
            ),
            SizedBox(height: 20),
            Text(
              'Select Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            SelectBox(
              icon: Icons.access_time_rounded,
              text: selectedTime == null
                  ? 'Choose time'
                  : selectedTime?.format(context) ?? 'Choose time',
              onTap: chooseTime,
            ),
            SizedBox(height: 20),
            Text(
              'Duration',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [1, 2, 3, 5].map(
                    (hour) {
                  final active = duration == hour;

                  return Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            duration = hour;
                          });
                        },
                        child: AnimatedContainer(
                          duration:
                          Duration(milliseconds: 200),
                          padding:
                          EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: active
                                ? Color(0xFF8B5CF6)
                                : Color(0xFF151927),
                            borderRadius:
                            BorderRadius.circular(15),
                            border: Border.all(
                              color: active
                                  ? Color(
                                  0xFF8B5CF6)
                                  : Color(
                                  0xFF292D40),
                            ),
                          ),
                          child: Text(
                            '${hour}h',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF131724),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '₹${total.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF06B6D4),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GradientButton(
              title: 'CONFIRM BOOKING',
              icon: Icons.check_circle_outline_rounded,
              onTap: confirmBooking,
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   BOOKING CONFIRMATION
============================================================ */

class BookingConfirmationPage extends StatelessWidget {
  final Booking booking;

  BookingConfirmationPage({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Booking Confirmed'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x2234D399),
              ),
              child: Icon(
                Icons.check_circle_rounded,
                color: Colors.greenAccent,
                size: 65,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'BOOKING CONFIRMED!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your gaming station is ready.',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 30),
            _bookingCard(),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              BookingsPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('VIEW BOOKING'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                            (route) => route.isFirst,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Color(0xFF8B5CF6),
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('HOME'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookingCard() {
    return Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Color(0xFF2C3044),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'BOOKING ID',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ),
              Text(
                booking.id,
                style: TextStyle(
                  color: Color(0xFF06B6D4),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Divider(height: 30),
          DetailRow(
            title: 'Gaming PC',
            value: booking.pc,
          ),
          DetailRow(
            title: 'Date',
            value:
            '${booking.date.day}/${booking.date.month}/${booking.date.year}',
          ),
          DetailRow(
            title: 'Time',
            value:
            '${booking.time.hourOfPeriod == 0 ? 12 : booking.time.hourOfPeriod}:${booking.time.minute.toString().padLeft(2, '0')} ${booking.time.period == DayPeriod.am ? 'AM' : 'PM'}',
          ),
          DetailRow(
            title: 'Duration',
            value: '${booking.duration} hours',
          ),
          DetailRow(
            title: 'Total',
            value:
            '₹${booking.amount.toStringAsFixed(0)}',
          ),
        ],
      ),
    );
  }

}


/* ============================================================
   BOOKINGS
============================================================ */

class BookingsPage extends StatefulWidget {
  BookingsPage({super.key});

  @override
  State<BookingsPage> createState() =>
      _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  void cancelBooking(int index) {
    setState(() {
      AppState.bookings[index].status = 'Cancelled';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking cancelled'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bookings',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: AppState.bookings.isEmpty
          ? EmptyState(
        icon: Icons.calendar_month_rounded,
        title: 'No bookings yet',
        message:
        'Book a premium gaming PC from Game Studio.',
      )
          : ListView.builder(
        padding: EdgeInsets.all(18),
        itemCount: AppState.bookings.length,
        itemBuilder: (_, index) {
          final booking =
          AppState.bookings[index];

          return Padding(
            padding:
            EdgeInsets.only(bottom: 15),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xFF131724),
                borderRadius:
                BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF282C40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(14),
                          gradient:
                          LinearGradient(
                            colors: [
                              Color(0xFF8B5CF6),
                              Color(0xFF06B6D4),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.computer_rounded,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${booking.pc} PC',
                              style:
                              TextStyle(
                                fontWeight:
                                FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              booking.id,
                              style:
                              TextStyle(
                                color:
                                Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StatusBadge(
                        status: booking.status,
                      ),
                    ],
                  ),
                  Divider(height: 28),
                  DetailRow(
                    title: 'Date',
                    value:
                    '${booking.date.day}/${booking.date.month}/${booking.date.year}',
                  ),
                  DetailRow(
                    title: 'Time',
                    value:
                    booking.time.format(context),
                  ),
                  DetailRow(
                    title: 'Duration',
                    value:
                    '${booking.duration} hours',
                  ),
                  DetailRow(
                    title: 'Amount',
                    value:
                    '₹${booking.amount.toStringAsFixed(0)}',
                  ),
                  if (booking.status ==
                      'Upcoming') ...[
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () =>
                            cancelBooking(index),
                        style:
                        OutlinedButton.styleFrom(
                          foregroundColor:
                          Colors.redAccent,
                          side:
                          BorderSide(
                            color:
                            Colors.redAccent,
                          ),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                12),
                          ),
                        ),
                        child:
                        Text('CANCEL BOOKING'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ============================================================
   CART PAGE
============================================================ */

class CartPage extends StatefulWidget {
  final VoidCallback? onRefresh;

  CartPage({
    super.key,
    this.onRefresh,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static Color pageBg = Color(0xFF080B14);
  static Color cardBg = Color(0xFF131724);
  static Color softCard = Color(0xFF151927);

  double get discount {
    if (AppState.cartTotal >= 3000) return 300;
    return 0;
  }

  double get total => max(0, AppState.cartTotal - discount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 6),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Review your games before checkout',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: softCard,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AppState.cart.isEmpty
                  ? EmptyState(
                icon: Icons.shopping_cart_outlined,
                title: 'Your cart is empty',
                message: 'Add some games to start shopping.',
              )
                  : SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20, 18, 20, 25),
                child: Column(
                  children: [
                    ...List.generate(
                      AppState.cart.length,
                          (index) => Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: CartItemCard(
                          item: AppState.cart[index],
                          onChanged: () {
                            setState(() {});
                            widget.onRefresh?.call();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    _summary(),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8B5CF6),
                            Color(0xFF06B6D4),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x338B5CF6),
                            blurRadius: 18,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CheckoutPage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.lock_rounded),
                          label: Text(
                            'CHECKOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.8,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 11),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white70,
                          side: BorderSide(color: Color(0xFF34394B)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'CONTINUE SHOPPING',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summary() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF1D2232)),
      ),
      child: Column(
        children: [
          DetailRow(
            title: 'Subtotal',
            value: '₹${AppState.cartTotal.toStringAsFixed(0)}',
          ),
          DetailRow(
            title: 'Discount',
            value: '- ₹${discount.toStringAsFixed(0)}',
            valueColor: Colors.greenAccent,
          ),
          Divider(
            height: 28,
            color: Color(0xFF303546),
          ),
          DetailRow(
            title: 'Total',
            value: '₹${total.toStringAsFixed(0)}',
            big: true,
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   CHECKOUT
============================================================ */




/* ============================================================
   CHECKOUT PAGE
============================================================ */

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String payment = 'UPI';
  bool processing = false;

  double get subtotal => AppState.cartTotal;

  double get discount => subtotal >= 3000 ? 300 : 0;

  double get total => max(0, subtotal - discount);

  @override
  void initState() {
    super.initState();
    nameController.text = AuthState.username;
    emailController.text = AuthState.email;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void placeOrder() {
    if (AppState.cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Your cart is empty.')),
      );
      return;
    }

    final name = nameController.text.trim();
    final enteredEmail = emailController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || enteredEmail.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please complete all customer details.'),
        ),
      );
      return;
    }

    setState(() => processing = true);

    Timer(Duration(seconds: 1), () {
      if (!mounted) return;

      final random = Random();
      final orderId = 'GZX-${100000 + random.nextInt(900000)}';

      // Save the cart contents BEFORE clearing the cart.
      final purchasedGames = AppState.cart
          .map((item) => item.game.name)
          .toList();

      // Use the logged-in email; if it is empty, use checkout email.
      final orderEmail = AuthState.email.trim().isNotEmpty
          ? AuthState.email.trim()
          : enteredEmail;

      // Make sure the current user can see the order immediately.
      AuthState.email = orderEmail;
      if (AuthState.username.trim().isEmpty) {
        AuthState.username = name;
      }

      AppState.orders.add(
        OrderRecord(
          id: orderId,
          email: orderEmail,
          username: AuthState.username,
          games: purchasedGames,
          amount: total,
          status: 'Activated',
          date: DateTime.now(),
        ),
      );

      // Clear cart only after the order has been saved.
      AppState.cart.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OrderSuccessPage(
            orderId: orderId,
            total: total,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 15),
            CustomField(
              controller: nameController,
              label: 'Full Name',
              icon: Icons.person_outline_rounded,
            ),
            CustomField(
              controller: emailController,
              label: 'Email',
              icon: Icons.email_outlined,
            ),
            CustomField(
              controller: phoneController,
              label: 'Phone',
              icon: Icons.phone_outlined,
            ),
            SizedBox(height: 20),

            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 12),
            _paymentOption(
              title: 'UPI',
              icon: Icons.account_balance_rounded,
            ),
            _paymentOption(
              title: 'Card',
              icon: Icons.credit_card_rounded,
            ),
            _paymentOption(
              title: 'Cash / Pay Later',
              icon: Icons.payments_outlined,
            ),

            SizedBox(height: 20),

            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xFF131724),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF282C40),
                ),
              ),
              child: Column(
                children: [
                  ...AppState.cart.map(
                        (item) => DetailRow(
                      title: '${item.game.name} × ${item.quantity}',
                      value: '₹${item.total.toStringAsFixed(0)}',
                    ),
                  ),
                  Divider(height: 25),
                  DetailRow(
                    title: 'Subtotal',
                    value: '₹${subtotal.toStringAsFixed(0)}',
                  ),
                  DetailRow(
                    title: 'Discount',
                    value: '- ₹${discount.toStringAsFixed(0)}',
                    valueColor: Colors.greenAccent,
                  ),
                  DetailRow(
                    title: 'Total',
                    value: '₹${total.toStringAsFixed(0)}',
                    big: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: GradientButton(
                title: processing ? 'PROCESSING...' : 'PLACE ORDER',
                icon: processing
                    ? Icons.hourglass_top_rounded
                    : Icons.check_circle_outline_rounded,
                onTap: processing ? () {} : placeOrder,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption({
    required String title,
    required IconData icon,
  }) {
    final selected = payment == title;

    return GestureDetector(
      onTap: () => setState(() => payment = title),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? Color(0x332E1B68)
              : Color(0xFF131724),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? Color(0xFF8B5CF6)
                : Color(0xFF282C40),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? Color(0xFF8B5CF6)
                  : Colors.white54,
              size: 25,
            ),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.white70,
                ),
              ),
            ),
            Radio<String>(
              value: title,
              groupValue: payment,
              activeColor: Color(0xFF8B5CF6),
              onChanged: (value) {
                if (value == null) return;
                setState(() => payment = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
   MY ORDERS PAGE
============================================================ */

class OrdersPage extends StatefulWidget {
  OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final orders = AppState.currentUserOrders;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).popUntil(
                  (route) => route.isFirst,
            );
          },
        ),

        title: Text(
          'My Orders',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: orders.isEmpty
          ? _emptyOrders()
          : ListView.builder(
        padding: EdgeInsets.all(18),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return _orderCard(orders[index]);
        },
      ),
    );
  }

  Widget _emptyOrders() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Color(0xFF8B5CF6).withOpacity(.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 55,
                color: Color(0xFF8B5CF6),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'NO ORDERS YET',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your purchased games will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderCard(OrderRecord order) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFF282C40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Color(0xFF8B5CF6).withOpacity(.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.videogame_asset_rounded,
                  color: Color(0xFF9B6CFF),
                  size: 22,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  order.games.join(', '),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.status,
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(color: Color(0xFF343848)),
          SizedBox(height: 14),
          _orderRow('Order ID', order.id),
          SizedBox(height: 12),
          _orderRow(
            'Amount',
            '₹${order.amount.toStringAsFixed(0)}',
          ),
          SizedBox(height: 12),
          _orderRow('Date', _formatDate(order.date)),
        ],
      ),
    );
  }

  Widget _orderRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: title == 'Amount'
                  ? Color(0xFFB88CFF)
                  : Colors.white,
              fontSize: title == 'Amount' ? 16 : 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    return '$day/$month/${date.year}  $hour:$minute';
  }
}

/* ============================================================
   ORDER SUCCESS PAGE
============================================================ */

class OrderSuccessPage extends StatelessWidget {
  final String orderId;
  final double total;

  OrderSuccessPage({
    super.key,
    required this.orderId,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              /* SUCCESS ICON */

              Container(
                width: 110,
                height: 110,

                decoration: BoxDecoration(
                  color: Colors.green
                      .withOpacity(.12),

                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.check_circle_rounded,

                  size: 75,

                  color:
                  Colors.greenAccent,
                ),
              ),

              SizedBox(height: 25),

              Text(
                'ORDER PLACED!',

                style: TextStyle(
                  fontSize: 28,

                  fontWeight:
                  FontWeight.w900,
                ),
              ),

              SizedBox(height: 10),
              Text(
                'Your game has been activated successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              /* ORDER DETAILS */
              Container(
                width: double.infinity,
                padding:
                EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                  Color(0xFF131724),
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    DetailRow(
                      title: 'Order ID',
                      value: orderId,
                    ),
                    SizedBox(height: 12),
                    DetailRow(
                      title: 'Status',
                      value: 'Activated',
                      valueColor:
                      Colors.greenAccent,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              /* MY ORDERS */

              SizedBox(
                width: double.infinity,

                child: GradientButton(
                  title: 'VIEW MY ORDERS',

                  icon:
                  Icons.receipt_long_rounded,

                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            OrdersPage(),
                      ),

                          (route) => false,
                    );
                  },
                ),
              ),

              SizedBox(height: 12),

              /* CONTINUE SHOPPING */

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: Text(
                  'Continue Shopping',

                  style: TextStyle(
                    color:
                    Color(0xFFB88CFF),

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/* ============================================================
   WISHLIST
============================================================ */

class WishlistPage extends StatefulWidget {
  WishlistPage({super.key});

  @override
  State<WishlistPage> createState() =>
      _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: AppState.wishlist.isEmpty
          ? EmptyState(
        icon: Icons.favorite_border_rounded,
        title: 'Wishlist is empty',
        message:
        'Save your favourite games here.',
      )
          : GridView.builder(
        padding: EdgeInsets.all(18),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          mainAxisExtent: 390,
        ),
        itemCount: AppState.wishlist.length,
        itemBuilder: (_, index) {
          return GameCard(
            game: AppState.wishlist[index],
            onChanged: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}

/* ============================================================
   OFFERS
============================================================ */

class OffersPage extends StatelessWidget {
  OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Special Offers',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          OfferLargeCard(
            title: 'Weekend Sale',
            subtitle:
            'Get up to 50% OFF on selected games.',
            icon: Icons.local_fire_department_rounded,
          ),
          OfferLargeCard(
            title: 'Gamer Pack',
            subtitle:
            'Buy 2 games and unlock special deals.',
            icon: Icons.card_giftcard_rounded,
          ),
          OfferLargeCard(
            title: 'Night Gaming',
            subtitle:
            'Book Pro or Ultra PCs for special night rates.',
            icon: Icons.nightlight_round,
          ),
        ],
      ),
    );
  }
}

/* ============================================================
   NOTIFICATIONS
============================================================ */

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      [
        Icons.local_offer_rounded,
        'Weekend Sale is Live!',
        'Save up to 50% on selected games.',
      ],
      [
        Icons.computer_rounded,
        'Gaming Studio',
        'Pro and Ultra PCs are available for booking.',
      ],
      [
        Icons.gamepad_rounded,
        'New Games Added',
        'Check out the latest games in the store.',
      ],
      [
        Icons.card_giftcard_rounded,
        'Gamer Pack',
        'Special deals are available this week.',
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(18),
        itemCount: notifications.length,
        itemBuilder: (_, index) {
          return Container(
            margin:
            EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF131724),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0x228B5CF6),
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                  child: Icon(
                    notifications[index][0]
                    as IconData,
                    color:
                    Color(0xFF8B5CF6),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifications[index][1]
                        as String,
                        style: TextStyle(
                          fontWeight:
                          FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        notifications[index][2]
                        as String,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
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
    );
  }
}

/* ============================================================
   REVIEWS
============================================================ */

class ReviewsPage extends StatefulWidget {
  ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() =>
      _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double selectedRating = 5;
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void addReview() {
    if (commentController.text.trim().isEmpty) {
      return;
    }

    reviews.add(
      Review(
        username: 'You',
        rating: selectedRating,
        comment: commentController.text.trim(),
      ),
    );

    commentController.clear();

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Review added successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double average = 0;

    for (final review in reviews) {
      average += review.rating;
    }

    average = average / reviews.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Color(0xFF131724),
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    average.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:
                        List.generate(
                          5,
                              (_) => Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${reviews.length} user reviews',
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ...reviews.map(
                  (review) => Padding(
                padding:
                EdgeInsets.only(bottom: 12),
                child: ReviewTile(review: review),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF131724),
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write a Review',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children:
                    List.generate(
                      5,
                          (index) {
                        final value =
                            index + 1.0;

                        return IconButton(
                          onPressed: () {
                            setState(() {
                              selectedRating =
                                  value;
                            });
                          },
                          icon: Icon(
                            value <=
                                selectedRating
                                ? Icons.star_rounded
                                : Icons
                                .star_border_rounded,
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ),
                  TextField(
                    controller:
                    commentController,
                    maxLines: 4,
                    decoration:
                    InputDecoration(
                      hintText:
                      'Share your gaming experience...',
                      filled: true,
                      fillColor:
                      Color(0xFF0C0F19),
                      border:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            15),
                        borderSide:
                        BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  GradientButton(
                    title: 'SUBMIT REVIEW',
                    icon: Icons.send_rounded,
                    onTap: addReview,
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

/* ============================================================
   PROFILE
============================================================ */

class ProfilePage extends StatelessWidget {
  final VoidCallback? onRefresh;

  ProfilePage({super.key, this.onRefresh});

  String get initials {
    final name = AuthState.username.trim();
    if (name.isEmpty) return 'G';
    final parts = name.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final username = AuthState.username.isEmpty ? 'Gamer' : AuthState.username;
    final email = AuthState.email.isEmpty ? 'No email added' : AuthState.email;

    return Scaffold(
      backgroundColor: Color(0xFF080B14),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => onRefresh?.call(),
          color: Color(0xFF06B6D4),
          backgroundColor: Color(0xFF111522),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(18, 16, 18, 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(22, 24, 22, 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      colors: [Color(0xFF17152D), Color(0xFF101B2B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: Color(0xFF303650)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8B5CF6).withOpacity(.18),
                        blurRadius: 28,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xFF8B5CF6), Color(0xFF06B6D4)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF06B6D4).withOpacity(.28),
                                  blurRadius: 25,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                initials,
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 4,
                            child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Color(0xFF0B1220),
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xFF06B6D4), width: 2),
                              ),
                              child: Icon(Icons.verified_rounded, size: 18, color: Color(0xFF22D3EE)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        username,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, letterSpacing: .2),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email_rounded, size: 16, color: Color(0xFF22D3EE)),
                          SizedBox(width: 7),
                          Flexible(
                            child: Text(
                              email,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white60, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                        decoration: BoxDecoration(
                          color: Color(0xFF06B6D4).withOpacity(.10),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Color(0xFF06B6D4).withOpacity(.35)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.workspace_premium_rounded, size: 16, color: Color(0xFF67E8F9)),
                            SizedBox(width: 6),
                            Text('GAMEZONE MEMBER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.2, color: Color(0xFF67E8F9))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(child: _profileStat('${games.length}', 'Games', Icons.sports_esports_rounded)),
                    SizedBox(width: 10),
                    Expanded(child: _profileStat('${AppState.bookings.length}', 'Bookings', Icons.calendar_month_rounded)),
                    SizedBox(width: 10),
                    Expanded(child: _profileStat('${AppState.wishlist.length}', 'Wishlist', Icons.favorite_rounded)),
                  ],
                ),
                SizedBox(height: 22),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('YOUR GAMING HUB', style: TextStyle(color: Colors.white.withOpacity(.48), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.6)),
                ),
                SizedBox(height: 10),
                _profileOption(context, Icons.shopping_bag_rounded, 'My Orders', 'View your purchased games', () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrdersPage()))),
                _profileOption(context, Icons.calendar_month_rounded, 'My Bookings', 'Manage your PC studio sessions', () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookingsPage()))),
                _profileOption(context, Icons.favorite_rounded, 'Wishlist', 'Your saved games', () => Navigator.push(context, MaterialPageRoute(builder: (_) => WishlistPage()))),
                _profileOption(context, Icons.notifications_rounded, 'Notifications', 'Latest GAMEZONE updates', () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationsPage()))),
                _profileOption(context, Icons.star_rounded, 'Reviews', 'See your gaming feedback', () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReviewsPage()))),
                _profileOption(context, Icons.settings_rounded, 'Settings', 'Customize your experience', () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Settings coming soon')))),
                _profileOption(context, Icons.support_agent_rounded, 'Help & Support', 'Get help with GAMEZONE X', () => showDialog(context: context, builder: (_) => AlertDialog(backgroundColor: Color(0xFF111522), title: Text('GAMEZONE X Support'), content: Text('Support is simulated locally in this demo app.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))]))),
                SizedBox(height: 8),
                _logoutOption(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileStat(String value, String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17),
      decoration: BoxDecoration(
        color: Color(0xFF111522),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF20263A)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: Color(0xFF8B5CF6)),
          SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900)),
          SizedBox(height: 2),
          Text(label, style: TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _profileOption(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFF111522),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Color(0xFF20263A)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xFF8B5CF6).withOpacity(.11),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: Color(0xFFB9A4FF)),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.white38, fontSize: 11)),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.white38),
        onTap: onTap,
      ),
    );
  }

  Widget _logoutOption(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        gradient: LinearGradient(colors: [Color(0xFFEF4444).withOpacity(.12), Color(0xFFB91C1C).withOpacity(.07)]),
        border: Border.all(color: Color(0xFFEF4444).withOpacity(.35)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: Color(0xFFEF4444).withOpacity(.14), borderRadius: BorderRadius.circular(14)),
          child: Icon(Icons.logout_rounded, color: Color(0xFFF87171)),
        ),
        title: Text('Logout', style: TextStyle(color: Color(0xFFF87171), fontWeight: FontWeight.w900)),
        subtitle: Text('Sign out of this account', style: TextStyle(color: Colors.white38, fontSize: 11)),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xFFF87171)),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Color(0xFF111522),
              title: Text('Logout?'),
              content: Text('Sign out of ${AuthState.username}?'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text('CANCEL')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    AuthState.logout();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFEF4444), foregroundColor: Colors.white),
                  child: Text('LOGOUT'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ============================================================
   COMPONENTS
============================================================ */

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  PageHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Color(0xFF151927),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            Icons.search_rounded,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  GradientButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Color(0xFF8B5CF6),
              Color(0xFF06B6D4),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x338B5CF6),
              blurRadius: 15,
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          icon: Icon(icon),
          label: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              letterSpacing: .5,
            ),
          ),
        ),
      ),
    );
  }
}

class QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function(BuildContext) onTap;

  QuickAction({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Color(0xFF131724),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Color(0xFF252A3D),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Color(0xFF8B5CF6),
              size: 25,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 3),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 9,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBadge extends StatelessWidget {
  final double rating;

  RatingBadge({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Color(0x332E2611),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 17,
          ),
          SizedBox(width: 4),
          Text(
            rating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  InfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Color(0xFF8B5CF6),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 9,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow:
                  TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
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

class RequirementRow extends StatelessWidget {
  final String title;
  final String value;

  RequirementRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PCSetupCard extends StatelessWidget {
  final PCSetup setup;
  final bool selected;
  final VoidCallback onTap;

  PCSetupCard({
    super.key,
    required this.setup,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected
              ? Color(0x221F75FE)
              : Color(0xFF131724),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected
                ? Color(0xFF8B5CF6)
                : Color(0xFF292D40),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8B5CF6),
                        Color(0xFF06B6D4),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.computer_rounded,
                    size: 28,
                  ),
                ),
                SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${setup.name} Setup',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '₹${setup.price.toStringAsFixed(0)}/hour',
                        style: TextStyle(
                          color: Color(0xFF06B6D4),
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (selected)
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.greenAccent,
                  ),
              ],
            ),
            SizedBox(height: 18),
            _spec(
              Icons.memory_rounded,
              setup.gpu,
            ),
            _spec(
              Icons.storage_rounded,
              setup.ram,
            ),
            _spec(
              Icons.monitor_rounded,
              setup.monitor,
            ),
            _spec(
              Icons.keyboard_rounded,
              setup.accessories,
            ),
          ],
        ),
      ),
    );
  }

  Widget _spec(IconData icon, String text) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: Colors.white38,
          ),
          SizedBox(width: 9),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  SelectBox({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Color(0xFF131724),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Color(0xFF292D40),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color(0xFF8B5CF6),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white38,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  final bool big;

  DetailRow({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
    this.big = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: big
                    ? Colors.white
                    : Colors.white54,
                fontWeight:
                big ? FontWeight.w900 : null,
                fontSize: big ? 16 : 13,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.w900,
              fontSize: big ? 19 : 13,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;

  StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final cancelled = status == 'Cancelled';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: cancelled
            ? Color(0x33EF4444)
            : Color(0x3334D399),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: cancelled
              ? Colors.redAccent
              : Colors.greenAccent,
          fontSize: 10,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onChanged;

  CartItemCard({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.game.image,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 85,
                  height: 85,
                  color: Color(0xFF202538),
                  child: Icon(
                    Icons.videogame_asset_rounded,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  item.game.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '₹${item.game.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Color(0xFF06B6D4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    _quantityButton(
                      Icons.remove,
                          () {
                        if (item.quantity > 1) {
                          item.quantity--;
                          onChanged();
                        }
                      },
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        '${item.quantity}',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    _quantityButton(
                      Icons.add,
                          () {
                        item.quantity++;
                        onChanged();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              AppState.cart.remove(item);
              onChanged();
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(
      IconData icon,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xFF252A3D),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 15,
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  CustomField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Color(0xFF131724),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: Colors.white24,
            ),
            SizedBox(height: 18),
            Text(
              title,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final Review review;

  ReviewTile({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1A1E2C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor:
            Color(0xFF8B5CF6),
            child: Text(
              review.username[0],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.username,
                        style:
                        TextStyle(
                          fontWeight:
                          FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      review.rating.toString(),
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  review.comment,
                  style: TextStyle(
                    color: Colors.white60,
                    height: 1.4,
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

class OfferLargeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  OfferLargeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Color(0xFF312E81),
            Color(0xFF164E63),
          ],
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 45,
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.4,
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

class StatCard extends StatelessWidget {
  final String value;
  final String label;

  StatCard({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool danger;

  ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
        EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF131724),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: danger
                  ? Colors.redAccent
                  : Colors.white60,
            ),
            SizedBox(width: 13),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: danger
                      ? Colors.redAccent
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: danger
                  ? Colors.redAccent
                  : Colors.white30,
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureGrid extends StatelessWidget {
  FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      [Icons.wifi_rounded, 'High-Speed WiFi'],
      [Icons.ac_unit_rounded, 'Air Conditioned'],
      [Icons.local_cafe_rounded, 'Gaming Cafe'],
      [Icons.security_rounded, 'Secure'],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics:
      NeverScrollableScrollPhysics(),
      itemCount: features.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.4,
      ),
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Color(0xFF131724),
            borderRadius:
            BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(
                features[index][0] as IconData,
                color:
                Color(0xFF06B6D4),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  features[index][1] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final String id;
  final String game;
  final String price;
  final String status;

  OrderCard({
    super.key,
    required this.id,
    required this.game,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFF131724),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.videogame_asset_rounded,
                color: Color(0xFF8B5CF6),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  game,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
              ),
              StatusBadge(
                status: status,
              ),
            ],
          ),
          Divider(height: 25),
          DetailRow(
            title: 'Order ID',
            value: id,
          ),
          DetailRow(
            title: 'Amount',
            value: price,
          ),
        ],
      ),
    );
  }
}
