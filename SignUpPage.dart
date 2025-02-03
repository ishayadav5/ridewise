import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Full page black background
      appBar: AppBar(
        title: const Text(
          "Let us know more about you!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // App bar black background
        elevation: 0, // No shadow under app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center the content vertically
            children: [
              // RIDEWISE Text (Bigger font size)
              const Text(
                'RIDEWISE',
                style: TextStyle(
                  fontSize: 32, // Larger font size
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Sign Up Text
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // First Name Field
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'First Name',
                  hintStyle: const TextStyle(color: Colors.black54),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 10),

              // Last Name Field
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Last Name',
                  hintStyle: const TextStyle(color: Colors.black54),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              // Username Section
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How should we call you?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter your username',
                        hintStyle: const TextStyle(color: Colors.black54),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Date of Birth Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'When were you born?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        _selectedDate == null
                            ? 'Select your birthdate'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Proceed Button
              ElevatedButton(
                onPressed: () {
                  // Get values from the controllers
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String username = _usernameController.text;
                  String birthDate = _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : 'Not selected';

                  // Debug print the values
                  debugPrint(
                      'First Name: $firstName, Last Name: $lastName, Username: $username, Birth Date: $birthDate');

                  // Navigate to HomePage (or another page) when button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(email: '',),  // Replace with your target page
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black, // Black text color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(fontSize: 16),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpPage(),
  ));
}
class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
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
