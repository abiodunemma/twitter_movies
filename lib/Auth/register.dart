import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _isTyping = false;
  final TextEditingController _controller = TextEditingController();

  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
             
              child: Row(
                children: [
                  Align(
  alignment: Alignment.centerLeft,
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15), 
    ),
    child: IconButton(
      color: Colors.white,
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ),
),
                ],
              ),
            ),
            const SizedBox(height: 60),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Join Eventro',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Let’s get you in. Join Eventro and start discovering amazing events near you.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            const Text(
              'Enter full name',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
const SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Username",
             
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                   borderSide: BorderSide(color:Color(0xFF7B7B7B)),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color:Color(0xFF7B7B7B), width: 1),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Enter email address', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
            ),
const SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter email address",
              
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color:Color(0xFF7B7B7B)),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color:Color(0xFF7B7B7B), width: 1),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Enter password',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
            ),
  const SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Password must contain 8 characters",
               prefixIcon: const Icon(Icons.lock, color: Colors.white),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: _isTyping ? Colors.white : Colors.grey, // white when typing
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                 borderSide: BorderSide(color:Color(0xFF7B7B7B)),
                 
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:Color(0xFF7B7B7B), width: 1),
                ),
              ),
            ),
            Spacer(),
Align(
  alignment: Alignment.bottomCenter,
  child: SizedBox(
    width: double.infinity, // or a fixed value like 300
    child: ElevatedButton(
      onPressed: () {},
      child: const Text(
        'Continue',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    ),
  ),
),
  const SizedBox(height: 20),
  const Center(
    child: Text (
      'Already have an account? Sign in',
      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)
    )
  ) 
          ],
        ),
      ),
    );
  }
}
