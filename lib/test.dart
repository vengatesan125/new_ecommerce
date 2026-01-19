import 'package:flutter/material.dart';

void main123() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ==================== HOME PAGE ====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Demo',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF0000),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Flutter UI Class',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Student Basic UI Components',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UIElementsPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'View All UI Elements',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== UI ELEMENTS PAGE ====================
class UIElementsPage extends StatefulWidget {
  const UIElementsPage({super.key});

  @override
  State<UIElementsPage> createState() => _UIElementsPageState();
}

class _UIElementsPageState extends State<UIElementsPage> {
  // State variables
  bool switchValue = false;
  bool checkboxValue = false;
  String selectedRadio = 'Option 1';
  double sliderValue = 50;
  String dropdownValue = 'One';
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Basic UI Elements'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== TEXT WIDGETS ==========

            _buildSectionTitle('1. Text Widgets'),
            const Text(
              'This is a normal Text widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bold Text',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Italic Text',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            const Text(
              'Colored Text',
              style: TextStyle(fontSize: 16, color: Color(0XFFFF6C0C)),
            ),
            const Divider(height: 30),

            // ========== TEXT FIELD ==========
            _buildSectionTitle('2. TextField'),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
                hintText: 'Type here...',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const Divider(height: 30),

            // ========== BUTTONS ==========
            _buildSectionTitle('3. Buttons'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const Divider(height: 30),

            // ========== SWITCH ==========
            _buildSectionTitle('4. Switch'),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
            const Divider(height: 30),

            // ========== CHECKBOX ==========
            _buildSectionTitle('5. Checkbox'),
            CheckboxListTile(
              title: const Text('I agree to terms and conditions'),
              value: checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue = value ?? false;
                });
              },
            ),
            const Divider(height: 30),

            // ========== RADIO BUTTON ==========
            _buildSectionTitle('6. Radio Button'),
            RadioListTile<String>(
              title: const Text('Option 1'),
              value: 'Option 1',
              groupValue: selectedRadio,
              onChanged: (String? value) {
                setState(() {
                  selectedRadio = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Option 2'),
              value: 'Option 2',
              groupValue: selectedRadio,
              onChanged: (String? value) {
                setState(() {
                  selectedRadio = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Option 3'),
              value: 'Option 3',
              groupValue: selectedRadio,
              onChanged: (String? value) {
                setState(() {
                  selectedRadio = value!;
                });
              },
            ),
            const Divider(height: 30),

            // ========== SLIDER ==========
            _buildSectionTitle('7. Slider'),
            Text('Value: ${sliderValue.round()}'),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            const Divider(height: 30),

            // ========== DROPDOWN ==========
            _buildSectionTitle('8. Dropdown'),
            DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              items: <String>['One', 'Two', 'Three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            const Divider(height: 30),

            // ========== LIST VIEW ==========
            _buildSectionTitle('9. ListView'),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Subtitle for item ${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  );
                },
              ),
            ),
            const Divider(height: 30),

            // ========== LAYOUTS ==========
            _buildSectionTitle('10. Layout - Row'),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildColorBox(Colors.red, 'Box 1'),
                  _buildColorBox(Colors.green, 'Box 2'),
                  _buildColorBox(Colors.blue, 'Box 3'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('11. Layout - Column'),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.green.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildColorBox(Colors.purple, 'Box 1'),
                  const SizedBox(height: 10),
                  _buildColorBox(Colors.orange, 'Box 2'),
                  const SizedBox(height: 10),
                  _buildColorBox(Colors.teal, 'Box 3'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('12. Layout - Stack'),
            Container(
              height: 200,
              color: Colors.grey.shade200,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red.withOpacity(0.7),
                      child: const Center(child: Text('Layer 1')),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 60,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue.withOpacity(0.7),
                      child: const Center(child: Text('Layer 2')),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 100,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green.withOpacity(0.7),
                      child: const Center(child: Text('Layer 3')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle('13. Layout - GridView'),
            Container(
              height: 250,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(9, (index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'Grid ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const Divider(height: 30),

            // ========== CONTAINER & CARD ==========
            _buildSectionTitle('14. Container & Card'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: const Text(
                'This is a Container with decoration',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Card Title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('This is a Card widget with elevation and padding.'),
                  ],
                ),
              ),
            ),
            const Divider(height: 30),

            // ========== ICONS ==========
            _buildSectionTitle('15. Icons'),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: const [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.star, size: 40, color: Colors.amber),
                Icon(Icons.settings, size: 40, color: Colors.grey),
                Icon(Icons.shopping_cart, size: 40, color: Colors.green),
                Icon(Icons.person, size: 40, color: Colors.purple),
              ],
            ),
            const Divider(height: 30),

            // ========== CIRCULAR PROGRESS INDICATOR ==========
            _buildSectionTitle('16. Progress Indicators'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ========== IMAGE ==========
            _buildSectionTitle('17. Image (using Icon as placeholder)'),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.image,
                  size: 80,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ========== DIVIDER & VERTICAL DIVIDER ==========
            _buildSectionTitle('18. Divider'),
            const Divider(thickness: 2, color: Colors.blue),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Container(height: 50, color: Colors.red)),
                const VerticalDivider(thickness: 2, color: Colors.black),
                Expanded(child: Container(height: 50, color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 30),

            // ========== ALERT DIALOG BUTTON ==========
            _buildSectionTitle('19. Alert Dialog'),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const Text('This is an example of Alert Dialog'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Alert Dialog'),
            ),
            const SizedBox(height: 20),

            // ========== SNACKBAR ==========
            _buildSectionTitle('20. SnackBar'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('This is a SnackBar!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Show SnackBar'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildColorBox(Color color, String label) {
    return Container(
      width: 80,
      height: 80,
      color: color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
