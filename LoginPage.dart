import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: const Text('Login'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Spacing at the top
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[850], // Dark gray background for the container
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Verify OTP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text color
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Enter the OTP sent to your phone number or email:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white, // White text color
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: otpController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // White background for the input box
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter OTP',
                        hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Spacing between sections
              const Text(
                'How should we call you?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // White background for the input box
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter your username',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                ),
              ),
              const SizedBox(height: 30), // Spacing before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String otp = otpController.text;
                    String username = usernameController.text;

                    // You can add validation and navigation logic here
                    if (otp.isEmpty || username.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                    } else {
                      debugPrint('OTP: $otp, Username: $username');
                      // Navigate to the HomePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White button background
                    foregroundColor: Colors.black, // Black text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Rounded button
                    ),
                  ),
                  child: const Text('Proceed'),

                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a HomePage widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(email: 'john.doe@example.com'), // Default email
    );
  }
}

// Home Page
class MyHomePage extends StatefulWidget {
  final String email;

  const MyHomePage({super.key, required this.email});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _wheelAnimationController;

  @override
  void initState() {
    super.initState();
    _wheelAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _wheelAnimationController.dispose();
    super.dispose();
  }

  void _navigateToDestinationPage() {
    if (_controller.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DestinationPage(location: _controller.text.trim()),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a location.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('RideWise'),
        backgroundColor: Colors.black,
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildHeaderWithAnimation(),
            const SizedBox(height: 50),
            _buildLocationInput(),
            const SizedBox(height: 30),
            _buildFindRideButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('View Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewProfilePage(email: widget.email),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Previous Rides'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PreviousRidesPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_shipping),
            title: const Text('Send Parcel'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SendParcelPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderWithAnimation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'RideWise',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Arial',
              letterSpacing: 2,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _wheelAnimationController,
          builder: (context, child) {
            return Transform.rotate(
              angle: _wheelAnimationController.value * 6.28,
              child: child,
            );
          },
          child: const Icon(
            Icons.directions_bike,
            color: Colors.white,
            size: 50,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: _controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[800],
          hintText: 'Where do you want to go?',
          hintStyle: const TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.location_on, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildFindRideButton() {
    return ElevatedButton(
      onPressed: _navigateToDestinationPage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: const Text(
        'Find Ride',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

// Destination Page
class DestinationPage extends StatelessWidget {
  final String location;

  const DestinationPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destination'),
      ),
      body: Center(
        child: Text(
          'You are going to $location!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// View Profile Page
class ViewProfilePage extends StatelessWidget {
  final String email;

  const ViewProfilePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text(
          'Welcome to your profile, $email!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Previous Rides Page
class PreviousRidesPage extends StatelessWidget {
  const PreviousRidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Rides'),
      ),
      body: const Center(
        child: Text(
          'This is the Previous Rides page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Send Parcel Page
class SendParcelPage extends StatelessWidget {
  const SendParcelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Parcel'),
      ),
      body: const Center(
        child: Text(
          'This is the Send Parcel page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
