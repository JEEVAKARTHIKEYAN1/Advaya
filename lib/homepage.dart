import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  final GlobalKey _education = GlobalKey();
  final GlobalKey _academic = GlobalKey();
  final GlobalKey _career = GlobalKey();
  final GlobalKey _custom = GlobalKey();
  // Function to scroll to the specific content section using GlobalKey
  void scrollToSection(GlobalKey key, BuildContext context) {
    final context = key.currentContext;
    if (context != null) {
      final scrollPosition = Scrollable.of(context).position;
      scrollPosition.ensureVisible(
        context.findRenderObject()!,
        alignment: 0.0, // Align to top of the screen
        duration: Duration(seconds: 1), // Scroll duration
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0F20),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.6,
              colors: [
                Color(0xFF778AE8).withOpacity(0.3),
                Color(0xFF778AE8).withOpacity(0.0),
              ],
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Pricing',
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        Icon(Icons.account_circle, color: Colors.white, size: 28),
                        SizedBox(width: 5),
                        Text(
                          'Sign up / Log in',
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        Icon(Icons.notifications, color: Colors.white, size: 28),
                        SizedBox(width: 30),
                        Icon(Icons.menu, color: Colors.white, size: 28),
                      ],
                    ),
                  ),
                ),
              ),

              // Welcome Texts
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'INNOVATED FOR YOU',
                  style:GoogleFonts.montserrat(
                    fontSize: 25.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF9C26D7), Color(0xFF1EB1DB)],
                      stops: [0.0, 1.0],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'WELCOME TO ADVAYA',
                    style:GoogleFonts.montserrat(
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'At Advaya',
                  style:GoogleFonts.montserrat(
                    fontSize: 25.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 740, // Set the desired width
                height: 140, // Set the desired height
                padding: EdgeInsets.all(16.0), // Add padding for inner spacing
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Text(
                  'We are committed to revolutionizing the educational experience with innovative technology solutions and personalized services. Our mission is to empower students, educators, and administrators by providing tools that simplify operations, enhance learning, and drive success.',
                  textAlign: TextAlign.center,
                  style:GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.73),
                  ),
                ),
              ),

              // Frames Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HoverableFrame(
                          imagePath: 'assets/image1.jpg',
                          frameName: 'Education ERP Software',
                          contentTitle: 'Education ERP',
                          contentText: 'Streamline your educational institution\'s operations and management.'),
                      SizedBox(width: 40),
                      HoverableFrame(
                          imagePath: 'assets/image2.jpg',
                          frameName: 'Academic Education Training and Tutoring',
                          contentTitle: 'Tutoring Solutions',
                          contentText: 'Online tutoring and academic support for all levels.'),
                      SizedBox(width: 40),
                      HoverableFrame(
                          imagePath: 'assets/image3.jpg',
                          frameName: 'Career Development and Software Internship',
                          contentTitle: 'Career Growth',
                          contentText: 'Prepare for success with career development programs and internships.'),
                      SizedBox(width: 40),
                      HoverableFrame(
                          imagePath: 'assets/image4.jpg',
                          frameName: 'Custom Software Development',
                          contentTitle: 'Custom Solutions',
                          contentText: 'Tailored software solutions to meet your unique business needs.'),
                    ],
                  ),
                ),
              ),
              // Rectangle at the bottom
            Container(
  width: double.infinity, // Full screen width
  height: 430, // Adjusted height to accommodate new content
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft, // Start from the top-left corner
      end: Alignment.bottomRight, // End at the bottom-right corner
      colors: [
        Color(0xFF8750AD), // First color (#8750AD)
        Color(0xFF7785D9), // Second color (#7785D9)
      ],
      stops: [0.0, 1.0], // Gradient stops, 0% for first color, 100% for second color
    ),
  ),
  child: Stack(
    children: [
      // "Quick Links" Frame
      Positioned(
        top: 50,
        left: (MediaQuery.of(context).size.width - 176) / 2,
        child: Container(
          width: 176,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF7E3299), // Frame color
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Quick Links',
            style:GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      // "Jump right in" Text
      Positioned(
        top: 100,
        left: 0,
        right: 0,
        child: Text(
          'JUMP RIGHT IN',
          textAlign: TextAlign.center,
          style:GoogleFonts.montserrat(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      // Descriptive Text
      Positioned(
        top: 180,
        left: MediaQuery.of(context).size.width * 0.1, // 10% from left
        right: MediaQuery.of(context).size.width * 0.1, // 10% from right
        child: Text(
          'We’ve streamlined our offerings to ensure you can easily navigate and discover the innovative services Advaya provides',
          textAlign: TextAlign.center,
          style:GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white.withOpacity(0.8), // 80% opacity
          ),
        ),
      ),
      // Four Frames in a Row
      Positioned(
        top: 240,
        left: 0,
        right: 0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 90),
            // Frame 1
            GestureDetector(
              onTap: () => scrollToSection(_education,context), // Trigger scroll on tap
              child:Container(
              width: 300,
              height: 91,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // White with 10% opacity
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, color: Colors.white, size: 24), // Education icon
                  SizedBox(height: 10),
                  Text(
                    'Education ERP Software Services',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(width: 50),
            // Frame 2
            GestureDetector(
              onTap: () => scrollToSection(_academic,context), // Trigger scroll on tap
              child:Container(
              width: 300,
              height: 91,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu_book, color: Colors.white, size: 24), // Book icon
                  SizedBox(height: 10),
                  Text(
                    'Academic Education Training and Tutoring Services',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(width: 50),
            // Frame 3
            GestureDetector(
              onTap: () => scrollToSection(_career,context), // Trigger scroll on tap
              child:Container(
              width: 300,
              height: 91,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.work, color: Colors.white, size: 24), // Work icon
                  SizedBox(height: 10),
                  Text(
                    'Career Development and Software Internship Services',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(width: 50),
            // Frame 4
            GestureDetector(
              onTap: () => scrollToSection(_custom,context), // Trigger scroll on tap
              child:Container(
              width: 300,
              height: 91,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.web, color: Colors.white, size: 24), // Web icon
                  SizedBox(height: 10),
                  Text(
                    'Custom Software Development Services for Website Development',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
    ],
  ),
),

//page 2
Stack(
            children: [
              // Background color container, ensuring it covers the entire content
              Container(
                color: Color.fromARGB(255, 10, 15, 32), // Solid dark background color
                width: double.infinity, // Stretch it across the width
                height:  1000, // Ensure height exceeds the content area
              ),
              
              // White shade overlay
              /*Container(
                color: Colors.white.withOpacity(0.2), // Adjust opacity for the white shade
                width: double.infinity, // Ensure it fills the entire width
                height: height + 1000, // Extend the height along with the content
              ),*/
              Center( // Centering the entire content
                child: Column(
                  children: [
                    SizedBox(height: 60), // Space added before the frame
                    Container(
                      key: _education,
                      width: 252,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.indigo[400], // A lighter shade of Indigo // Frame color
                        borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'SMART ERP SOLUTIONS', // Centered text
                          style: GoogleFonts.montserrat( // Using Google Fonts
                            fontSize: 16, // Font size
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5, // Space between words
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), // Space between the "BEST IN CLASS" and next content
                    Text(
                      'EDUCATION ERP SOFTWARE SERVICES', // New text
                      style: GoogleFonts.montserrat(
                        fontSize: 48, // Font size
                        color: Colors.white,
                        fontWeight: FontWeight.w900, // Extra bold
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                    SizedBox(height: 20), // Spacing between texts
                    // New subheading
                    Text(
                      'Streamlining educational operations with powerful, all-in-one ERP solutions for seamless management and growth.',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400, // Regular weight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100), // Spacing between texts and the first rectangle

                    // First transparent glassy rectangle (moved to the right)
                    Align(
                      alignment: Alignment.centerRight, // Move the rectangle to the right
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                         center: Alignment.center, // Center the gradient
                         radius: 0.9, // Adjust the radius to control the spread of the gradient
                         colors: [
                               Colors.white.withOpacity(0.3), // Inner color
                               const Color.fromARGB(255, 161, 155, 228).withOpacity(0.1), // Outer color
                                 ],
                             stops: [0.0, 1.0], // Defines the position of each color
                             ), // Transparent effect
                          borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        
                        child: Stack( // Stack used to position the frame on top
                          children: [
                            // The new frame with image inside it, centered within the first rectangle
                            Align(
                              alignment: Alignment(0.7,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 300, // Width of the frame
                                height: 400, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image9.jpg', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                             Align(
                              alignment: Alignment(-0.4,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 300, // Width of the frame
                                height: 400, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image10.jpg', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                             Align(
                              alignment: Alignment(0.2,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 350, // Width of the frame
                                height: 483, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image8.png', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                            // New container added on top of the first glassy rectangle
                            Align(
                              alignment: Alignment(-2.4,-0.5), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 450, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "EDUCATION ERP ",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 75, 17, 184), // A lighter shade of Indigo
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Streamlined Administrative Processes",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Our Education ERP Software simplifies and automates administrative tasks, from student enrollment and attendance tracking to grading and scheduling. By integrating these core functions into one platform, we reduce manual workload and improve operational efficiency, allowing staff to focus more on student engagement and success.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(128, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    SizedBox(
                                      width: 272,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 84, 99, 191),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      onPressed: () {
                                          print("Button Pressed");
                                        },
                                        child: Text(
                                          "EXPLORE",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100), // Space between the two rectangles
                    // Second transparent glassy rectangle (moved to the left)
                    Align(
                      alignment: Alignment.centerLeft, // Move the rectangle to the left
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                          center: Alignment.center, // Center the gradient
                           radius: 0.8, // Adjust the radius to control the spread of the gradient
                           colors: [
                                    Colors.white.withOpacity(0.3), // Inner color
                                    const Color.fromARGB(255, 161, 155, 228).withOpacity(0.1), // Outer color
                                    ],
                              stops: [0.0, 1.0], // Defines the position of each color
                               ), // Transparent effect
                          borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // New smaller rectangle at the center top with image
                            Align(
                              alignment: Alignment(0.1,-0.5),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 350.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 330, // Width of the new rectangle
                                  height: 495, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image11.jpg', // Replace with your image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // New rectangle at the bottom center with image
                            Align(
                              alignment: Alignment(0.1,0.5), // Move the rectangle to the bottom center
                              child: Padding(
                                padding: const EdgeInsets.only(left: 100.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 330, // Width of the new rectangle
                                  height: 495, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image12.jpg', // Replace with the second image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
      alignment: Alignment(-0.7,0.5), // Adjust alignment as needed
      child: Container(
        width: 450,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Transparent glassy effect
          borderRadius: BorderRadius.circular(25), // Rounded corners
          border: Border.all(
            color: Colors.white.withOpacity(0.5), // Stroke effect
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow for depth
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            // "Flowers on Podium" text
            Align(
              alignment: Alignment.centerLeft, // Left-aligned text
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Flowers on podium",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            // Generate button
            Align(
              alignment: Alignment.centerRight, // Right-aligned button
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 127,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      shadowColor: Colors.transparent, // No shadow for button
                    ),
                    onPressed: () {
                      print("Generate button clicked");
                    },
                    child: Text(
                      "Generate",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
                            // New container added on top of the second glassy rectangle
                            Align(
                              alignment: Alignment(2.5,-0.2), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 400, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                 child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "EDUCATION ERP",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 75, 17, 184),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Customizable and Scalable Solutions",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Our ERP system is tailored to the specific needs of schools, colleges, and universities. With real-time analytics and powerful financial management tools, it enables informed decision-making and enhances the learning experience, ensuring long-term growth and success.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(128, 255, 255, 255),
                                      ),
                                      ),
                                  ],
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60), // Space below if necessary
                  ],
                ),
              ),
            ],
          ),
  //page3
   Stack(
            children: [
              // Background color container, ensuring it covers the entire content
              Container(
                color: Color(0xFF0A1920), // Solid dark background color
                width: double.infinity, // Stretch it across the width
                height: MediaQuery.of(context).size.height + 1000, // Ensure height exceeds the content area
              ),
              // Gradient background that extends to fill the entire height of the content
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center, // Center of the gradient
                    radius: 1.5, // Radius of the gradient
                    colors: [
                      Color.fromRGBO(0, 66, 136, 1).withOpacity(1), // Start with semi-transparent #00A8E0
                      Color(0xFF0A1920), // End with solid dark background
                    ],
                    stops: [0.0, 1.0], // Define color positions
                  ),
                ),
                width: double.infinity, // Stretch it across the width
                height: MediaQuery.of(context).size.height + 1000, // Make it tall enough for the entire content
              ),
              // White shade overlay
              Container(
                color: Colors.white.withOpacity(0.2), // Adjust opacity for the white shade
                width: double.infinity, // Ensure it fills the entire width
                height: MediaQuery.of(context).size.height + 1000, // Extend the height along with the content
              ),
              Center( // Centering the entire content
                child: Column(
                  children: [
                    SizedBox(height: 60), // Space added before the frame
                    Container(
                      key:_academic,
                      width: 196,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1AD1E), // Frame color
                        borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'BEST IN CLASS', // Centered text
                          style: GoogleFonts.montserrat( // Using Google Fonts
                            fontSize: 16, // Font size
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5, // Space between words
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), // Space between the "BEST IN CLASS" and next content
                    Text(
                      'ACADEMIC EDUCATION TRAINING AND \nTUTORING SERVICES', // New text
                      style: GoogleFonts.montserrat(
                        fontSize: 48, // Font size
                        color: Colors.white,
                        fontWeight: FontWeight.w900, // Extra bold
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                    SizedBox(height: 20), // Spacing between texts
                    // New subheading
                    Text(
                      'Personalized Support to Boost Academic Success',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400, // Regular weight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100), // Spacing between texts and the first rectangle

                    // First transparent glassy rectangle (moved to the right)
                    Align(
                      alignment: Alignment.centerRight, // Move the rectangle to the right
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 138, 204, 240).withOpacity(0.1), // Transparent effect
                          borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack( // Stack used to position the frame on top
                          children: [
                            // The new frame with image inside it, centered within the first rectangle
                            Align(
                              alignment: Alignment(0.5,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 670, // Width of the frame
                                height: 504, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image5.jpg', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                            // New container added on top of the first glassy rectangle
                            Align(
                              alignment: Alignment(-2.4,-0.5), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 450, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ACADEMIC EDUCATION",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 251, 193, 2),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Tailored Tutoring for Every Student",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Our Academic Education Training and Tutoring Services offer personalized instruction to meet each student's unique learning needs. From one-on-one tutoring to group sessions, we focus on building understanding and confidence in subjects like math, science, language arts, and more.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    SizedBox(
                                      width: 272,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFE19B08),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        onPressed: () {
                                          print("Button Pressed");
                                        },
                                        child: Text(
                                          "EXPLORE",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100), // Space between the two rectangles
                    // Second transparent glassy rectangle (moved to the left)
                    Align(
                      alignment: Alignment.centerLeft, // Move the rectangle to the left
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 138, 204, 240).withOpacity(0.1), // Transparent effect
                          borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // New smaller rectangle at the center top with image
                            Align(
                              alignment: Alignment(0,-0.5),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 350.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 447, // Width of the new rectangle
                                  height: 447, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image6.jpg', // Replace with your image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // New rectangle at the bottom center with image
                            Align(
                              alignment: Alignment(-0.1,0.5), // Move the rectangle to the bottom center
                              child: Padding(
                                padding: const EdgeInsets.only(left: 100.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 447, // Width of the new rectangle
                                  height: 447, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image7.jpg', // Replace with the second image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
      alignment: Alignment(-0.7,0.5), // Adjust alignment as needed
      child: Container(
        width: 450,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Transparent glassy effect
          borderRadius: BorderRadius.circular(25), // Rounded corners
          border: Border.all(
            color: Colors.white.withOpacity(0.5), // Stroke effect
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow for depth
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            // "Flowers on Podium" text
            Align(
              alignment: Alignment.centerLeft, // Left-aligned text
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Flowers on podium",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            // Generate button
            Align(
              alignment: Alignment.centerRight, // Right-aligned button
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 127,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      shadowColor: Colors.transparent, // No shadow for button
                    ),
                    onPressed: () {
                      print("Generate button clicked");
                    },
                    child: Text(
                      "Generate",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
                            // New container added on top of the second glassy rectangle
                            Align(
                              alignment: Alignment(2.5,-0.2), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 400, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                 child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ACADEMIC EDUCATION",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 251, 193, 2),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Comprehensive Skill Development",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "We provide a range of specialized training programs, including test preparation, academic coaching, and workshops, designed to enhance students' skills and knowledge. Our experienced educators help students achieve their academic goals while fostering a love for learning and personal growth.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      ),
                                  ],
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60), // Space below if necessary
                  ],
                ),
              ),
            ],
          ),
//page4
Stack(
            children: [
              // Background color container, ensuring it covers the entire content
              Container(
                color: Color.fromARGB(255, 10, 15, 32), // Solid dark background color
                width: double.infinity, // Stretch it across the width
                height:  1000, // Ensure height exceeds the content area
              ),
              
              // White shade overlay
              /*Container(
                color: Colors.white.withOpacity(0.2), // Adjust opacity for the white shade
                width: double.infinity, // Ensure it fills the entire width
                height: height + 1000, // Extend the height along with the content
              ),*/
              Center( // Centering the entire content
                child: Column(
                  children: [
                    SizedBox(height: 60), // Space added before the frame
                    Container(
                      key: _career,
                      width: 252,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.indigo[400], // A lighter shade of Indigo // Frame color
                        borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'LIMITLESS ARTISTRY', // Centered text
                          style: GoogleFonts.montserrat( // Using Google Fonts
                            fontSize: 16, // Font size
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5, // Space between words
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), // Space between the "BEST IN CLASS" and next content
                    Text(
                      'CAREER DEVELOPMENT AND SOFTWARE\nINTERNSHIP SERVICES', // New text
                      style: GoogleFonts.montserrat(
                        fontSize: 48, // Font size
                        color: Colors.white,
                        fontWeight: FontWeight.w900, // Extra bold
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                    SizedBox(height: 20), // Spacing between texts
                    // New subheading
                    Text(
                      'Empowering Future Tech Professionals',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400, // Regular weight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100), // Spacing between texts and the first rectangle

                    // First transparent glassy rectangle (moved to the right)
                    Align(
                      alignment: Alignment.centerRight, // Move the rectangle to the right
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                         center: Alignment.center, // Center the gradient
                         radius: 0.9, // Adjust the radius to control the spread of the gradient
                         colors: [
                               Colors.white.withOpacity(0.3), // Inner color
                               const Color.fromARGB(255, 161, 155, 228).withOpacity(0.1), // Outer color
                                 ],
                             stops: [0.0, 1.0], // Defines the position of each color
                             ), // Transparent effect
                          borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        
                        child: Stack( // Stack used to position the frame on top
                          children: [
                            // The new frame with image inside it, centered within the first rectangle
                            Align(
                              alignment: Alignment(0.7,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 300, // Width of the frame
                                height: 400, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image9.jpg', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                             Align(
                              alignment: Alignment(-0.4,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 300, // Width of the frame
                                height: 400, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image10.jpg', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                             Align(
                              alignment: Alignment(0.2,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 350, // Width of the frame
                                height: 483, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image8.png', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                            // New container added on top of the first glassy rectangle
                            Align(
                              alignment: Alignment(-2.4,-0.5), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 450, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "GENERATIVE AI",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 75, 17, 184), // A lighter shade of Indigo
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Career Development for Success",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Our Career Development Services are designed to prepare individuals for successful careers in technology. From resume building to interview coaching and job placement assistance, we equip you with the tools and strategies needed to stand out in today’s competitive job market.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(128, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    SizedBox(
                                      width: 272,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 84, 99, 191),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      onPressed: () {
                                          print("Button Pressed");
                                        },
                                        child: Text(
                                          "EXPLORE",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100), // Space between the two rectangles
                    // Second transparent glassy rectangle (moved to the left)
                    Align(
                      alignment: Alignment.centerLeft, // Move the rectangle to the left
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                          center: Alignment.center, // Center the gradient
                           radius: 0.8, // Adjust the radius to control the spread of the gradient
                           colors: [
                                    Colors.white.withOpacity(0.3), // Inner color
                                    const Color.fromARGB(255, 161, 155, 228).withOpacity(0.1), // Outer color
                                    ],
                              stops: [0.0, 1.0], // Defines the position of each color
                               ), // Transparent effect
                          borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // New smaller rectangle at the center top with image
                            Align(
                              alignment: Alignment(0.1,-0.5),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 350.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 330, // Width of the new rectangle
                                  height: 495, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image11.jpg', // Replace with your image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // New rectangle at the bottom center with image
                            Align(
                              alignment: Alignment(0.1,0.5), // Move the rectangle to the bottom center
                              child: Padding(
                                padding: const EdgeInsets.only(left: 100.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 330, // Width of the new rectangle
                                  height: 495, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image12.jpg', // Replace with the second image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
      alignment: Alignment(-0.7,0.5), // Adjust alignment as needed
      child: Container(
        width: 450,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Transparent glassy effect
          borderRadius: BorderRadius.circular(25), // Rounded corners
          border: Border.all(
            color: Colors.white.withOpacity(0.5), // Stroke effect
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow for depth
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            // "Flowers on Podium" text
            Align(
              alignment: Alignment.centerLeft, // Left-aligned text
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Flowers on podium",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            // Generate button
            Align(
              alignment: Alignment.centerRight, // Right-aligned button
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 127,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      shadowColor: Colors.transparent, // No shadow for button
                    ),
                    onPressed: () {
                      print("Generate button clicked");
                    },
                    child: Text(
                      "Generate",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
                            // New container added on top of the second glassy rectangle
                            Align(
                              alignment: Alignment(2.5,-0.2), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 400, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                 child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "GENERATIVE AI",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 75, 17, 184),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Real-World Experience Through Internships",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Our Software Internship Services connect students and recent graduates with industry-leading projects, providing hands-on experience and valuable networking opportunities. This exposure enhances technical skills and gives interns a competitive edge in their career journey.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(128, 255, 255, 255),
                                      ),
                                      ),
                                  ],
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60), // Space below if necessary
                  ],
                ),
              ),
            ],
          ),
//page5
Stack(
            children: [
              // Background color container, ensuring it covers the entire content
              Container(
                color: Color(0xFF0A1920), // Solid dark background color
                width: double.infinity, // Stretch it across the width
                height: MediaQuery.of(context).size.height + 1000, // Ensure height exceeds the content area
              ),
              // Gradient background that extends to fill the entire height of the content
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center, // Center of the gradient
                    radius: 0.7, // Radius of the gradient
                    colors: [
                      Color.fromRGBO(2, 169, 13, 1).withOpacity(1), // Start with semi-transparent #00A8E0
                      Color.fromARGB(255, 2, 9, 12), // End with solid dark background
                    ],
                    stops: [0.0, 1.0], // Define color positions
                  ),
                ),
                width: double.infinity, // Stretch it across the width
                height: MediaQuery.of(context).size.height + 1000, // Make it tall enough for the entire content
              ),
              // White shade overlay
              Container(
                color: Colors.white.withOpacity(0.2), // Adjust opacity for the white shade
                width: double.infinity, // Ensure it fills the entire width
                height: MediaQuery.of(context).size.height + 1000, // Extend the height along with the content
              ),
              Center( // Centering the entire content
                child: Column(
                  children: [
                    SizedBox(height: 60), // Space added before the frame
                    Container(
                      key:_custom,
                      width: 196,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1AD1E), // Frame color
                        borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'BEST IN CLASS', // Centered text
                          style: GoogleFonts.montserrat( // Using Google Fonts
                            fontSize: 16, // Font size
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5, // Space between words
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), // Space between the "BEST IN CLASS" and next content
                    Text(
                      'Custom Software Development Services\nfor Website Development', // New text
                      style: GoogleFonts.montserrat(
                        fontSize: 48, // Font size
                        color: Colors.white,
                        fontWeight: FontWeight.w900, // Extra bold
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                    SizedBox(height: 20), // Spacing between texts
                    // New subheading
                    Text(
                      'Tailored Solutions to Enhance Your Online Presence',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400, // Regular weight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100), // Spacing between texts and the first rectangle

                    // First transparent glassy rectangle (moved to the right)
                    Align(
                      alignment: Alignment.centerRight, // Move the rectangle to the right
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 67, 202, 107).withOpacity(0.1), // Transparent effect
                          borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack( // Stack used to position the frame on top
                          children: [
                            // The new frame with image inside it, centered within the first rectangle
                            Align(
                              alignment: Alignment(0.5,0), // Center the frame inside the first rectangle
                              child: Container(
                                width: 670, // Width of the frame
                                height: 504, // Height of the frame
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0), // Slight shadow for the frame
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/image5.jpg', // Replace with your image path
                                    fit: BoxFit.cover, // Ensure the image fits the frame
                                  ),
                                ),
                              ),
                            ),
                            // New container added on top of the first glassy rectangle
                            Align(
                              alignment: Alignment(-2.4,-0.5), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 450, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CUSTOM SOFTWARE DESIGN",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 251, 193, 2),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Bespoke Website Development",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Our Custom Software Development Services specialize in creating personalized website solutions to meet your business needs. From design to development and maintenance, we ensure your website stands out, offering a seamless user experience with robust features and functionalities.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    SizedBox(
                                      width: 272,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFE19B08),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      onPressed: () {
                                          print("Button Pressed");
                                        },
                                        child: Text(
                                          "EXPLORE",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100), // Space between the two rectangles
                    // Second transparent glassy rectangle (moved to the left)
                    Align(
                      alignment: Alignment.centerLeft, // Move the rectangle to the left
                      child: Container(
                        width: 1023,
                        height: 580,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 67, 202, 107).withOpacity(0.1), // Transparent effect
                          borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0), // Shadow for the glassy effect
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // New smaller rectangle at the center top with image
                            Align(
                              alignment: Alignment(0,-0.5),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 350.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 447, // Width of the new rectangle
                                  height: 447, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image6.jpg', // Replace with your image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // New rectangle at the bottom center with image
                            Align(
                              alignment: Alignment(-0.1,0.5), // Move the rectangle to the bottom center
                              child: Padding(
                                padding: const EdgeInsets.only(left: 100.0), // Adjust padding for inch-by-inch control
                                child: Container(
                                  width: 447, // Width of the new rectangle
                                  height: 447, // Height of the new rectangle
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0), // Transparent effect
                                    borderRadius: BorderRadius.circular(40), // Optional: rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/image7.jpg', // Replace with the second image path
                                      fit: BoxFit.cover, // Ensure the image fits the frame
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
      alignment: Alignment(-0.7,0.5), // Adjust alignment as needed
      child: Container(
        width: 450,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Transparent glassy effect
          borderRadius: BorderRadius.circular(25), // Rounded corners
          border: Border.all(
            color: Colors.white.withOpacity(0.5), // Stroke effect
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow for depth
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            // "Flowers on Podium" text
            Align(
              alignment: Alignment.centerLeft, // Left-aligned text
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Flowers on podium",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            // Generate button
            Align(
              alignment: Alignment.centerRight, // Right-aligned button
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 127,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      shadowColor: Colors.transparent, // No shadow for button
                    ),
                    onPressed: () {
                      print("Generate button clicked");
                    },
                    child: Text(
                      "Generate",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
                            // New container added on top of the second glassy rectangle
                            Align(
                              alignment: Alignment(2.5,-0.2), // Align in the center for all directions
                              child: Container(
                                padding: const EdgeInsets.only(left: .0, top: 70.0),
                                width: 497, // Container width
                                height: 400, // Container height
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0), // Semi-transparent effect
                                  borderRadius: BorderRadius.circular(15), // Optional: rounded corners
                                ),
                                 child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CUSTOM SOFTWARE DESIGN",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(255, 251, 193, 2),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Innovative and Scalable Solutions",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "We focus on delivering scalable, secure, and high-performance websites using the latest technologies. Our custom solutions are designed to grow with your business, ensuring that your website remains adaptive, functional, and aligned with your evolving goals.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      ),
                                  ],
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60), // Space below if necessary
                  ],
                ),
              ),
            ],
          ),
//page 6
Column(
          children: [
            // Existing content with extended gradient background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6E428F), // Color 1 (0% of the gradient)
                    Color(0xFF7785D9), // Color 2 (100% of the gradient)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 60), // Space added before the frame
                    Container(
                      width: 252,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 126, 50, 153), // A lighter shade of Indigo // Frame color
                        borderRadius: BorderRadius.circular(0), // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'FREQUENTLY ASKED', // Centered text
                          style: GoogleFonts.montserrat( // Using Google Fonts
                            fontSize: 16, // Font size
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5, // Space between words
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Space between the "BEST IN CLASS" and next content
                    Text(
                      'DO YOU HAVE A QUESTION?', // New text
                      style: GoogleFonts.montserrat(
                        fontSize: 48, // Font size
                        color: Colors.white,
                        fontWeight: FontWeight.w900, // Extra bold
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                    SizedBox(height: 70), // Spacing between texts
                    Align(
                      alignment: Alignment(-0.7, 0), // Set the desired alignment (center, left, right, etc.)
                      child: Text(
                        'What is the purpose of your Education ERP Software?',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700, // Regular weight
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Space between texts
                    // Container with white transparent opacity and description
                    Align(
                      alignment: Alignment(-0.4, 0), // You can use any alignment like topLeft, bottomRight, etc.
                      child: Container(
                        width: 1068,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Our Education ERP Software helps educational institutions streamline their operations, including student enrollment, attendance tracking, grading, scheduling, and financial management, improving overall efficiency.',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: const Color.fromARGB(255, 249, 248, 248),
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 400), // Space between the content and the next container
                  ],
                ),
              ),
            ),

            // Stack widget to place the new container on top of the last container
            Stack(
              children: [
                // Original dark blue container
                Container(
                  width: double.infinity, // Full width of the screen
                  height: 400, // Fixed height of 400
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 14, 32), // Dark blue background
                    borderRadius: BorderRadius.vertical(top: Radius.circular(0)), // Rounded top corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column( // Use a column here to stack "ADVAYA" text and the divider
                    mainAxisAlignment: MainAxisAlignment.center, // Align the content vertically in the center
                    crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, top: 150.0), // Adjust padding as needed
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF9C26D7), Color(0xFF1EB1DB)],
                              stops: [0.0, 1.0],
                            ).createShader(bounds);
                          },
                          child: Text(
                            'ADVAYA',
                            style: GoogleFonts.montserrat(
                              fontSize: 90, // Adjusted font size
                              fontWeight: FontWeight.w900,
                              color: Colors.white, // Needed for ShaderMask
                            ),
                            textAlign: TextAlign.left, // Align text to the left
                          ),
                        ),
                      ),
                      // Divider below the "ADVAYA" text inside the same container
                      Divider(
                        color: Colors.white, // White color for the divider
                        thickness: 2, // Thickness of the divider
                        indent: 130, // Indentation from the left
                        endIndent: 120, // Indentation from the right
                      ),
                      
                      // New Text below the divider aligned with the indent
                      Padding(
                        padding: const EdgeInsets.only(left: 130.0, bottom: 20.0), // Align with the indent
                        child: Text(
                          'INNOVATED FOR YOU',
                          style: GoogleFonts.montserrat(
                            fontSize: 24, // Adjusted font size
                            fontWeight: FontWeight.w500, // Semi-bold text
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // New container placed on top of the last container
                Positioned(
                  left: 360, // Align it to the left with some margin
                  top: 50, // Position it 50px from the top
                  child: Container(
                    width: 140, // Full width minus left and right margins
                    height: 120, // Increased height to fit multiple rows of text
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 235, 236).withOpacity(0), // Apply opacity to the container (80% opacity)
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column( // Use a Column to stack text rows inside the container
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'COMPANY',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'About Us',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Services',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 590, // Align it to the left with some margin
                  top: 50, // Position it 50px from the top
                  child: Container(
                    width: 200, // Full width minus left and right margins
                    height: 180, // Increased height to fit multiple rows of text
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 235, 236).withOpacity(0), // Apply opacity to the container (80% opacity)
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column( // Use a Column to stack text rows inside the container
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'PRODUCTS',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Education ERP',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Academic Education',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Internship Services',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Website Development',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 900, // Align it to the left with some margin
                  top: 50, // Position it 50px from the top
                  child: Container(
                    width: 200, // Full width minus left and right margins
                    height: 180, // Increased height to fit multiple rows of text
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 235, 236).withOpacity(0), // Apply opacity to the container (80% opacity)
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column( // Use a Column to stack text rows inside the container
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'HELP',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Pricing',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Contact Us',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Education',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Developer',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 1110, // Align it to the left with some margin
                  top: 50, // Position it 50px from the top
                  child: Container(
                    width: 300, // Full width minus left and right margins
                    height: 110, // Increased height to fit multiple rows of text
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 235, 236).withOpacity(0), // Apply opacity to the container (80% opacity)
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column( // Use a Column to stack text rows inside the container
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'FOLLOW US',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between text rows
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Stay connected with us on social media for the latest updates & news.',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),







  
           ],
          ),
        ),
      ),
    );
  }
}

class HoverableFrame extends StatefulWidget {
  final String imagePath;
  final String frameName;
  final String contentTitle;
  final String contentText;

  const HoverableFrame({
    Key? key,
    required this.imagePath,
    required this.frameName,
    required this.contentTitle,
    required this.contentText,
  }) : super(key: key);

  @override
  _HoverableFrameState createState() => _HoverableFrameState();
}

class _HoverableFrameState extends State<HoverableFrame> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: _isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        curve: Curves.easeInOut,
        width: 260,
        height: 380,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            // Image with overlay
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 260,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _isHovered ? 0.7 : 1.0,
                child: Container(
                  color: Colors.black.withOpacity(_isHovered ? 0.5 : 0.0),
                ),
              ),
            ),
            // Hover content
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: _isHovered ? 60 : 160,
              left: 10,
              right: 10,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _isHovered ? 1 : 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.contentTitle,
                        style:GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.contentText,
                        textAlign: TextAlign.center,
                        style:GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Text under image
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              bottom: _isHovered ? -30 : 0,
              left: 10,
              right: 10,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _isHovered ? 0 : 1,
                child: Text(
                  widget.frameName,
                  textAlign: TextAlign.center,
                  style:GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
