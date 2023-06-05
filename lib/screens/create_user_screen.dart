import 'package:plantilla_usuarios/model/model.dart';
import 'package:plantilla_usuarios/screens/screens.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addresController;
  late TextEditingController phoneController;
  late TextEditingController photoController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    addresController = TextEditingController();
    phoneController = TextEditingController();
    photoController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addresController.dispose();
    phoneController.dispose();
    photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: addresController,
                decoration: InputDecoration(labelText: 'Addres'),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextFormField(
                controller: photoController,
                decoration: InputDecoration(labelText: 'Photo URL'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Usuarios newUser = Usuarios(
                    name: nameController.text,
                    email: emailController.text,
                    addres: addresController.text,
                    phone: phoneController.text,
                    photo: photoController.text,
                  );
                  Navigator.of(context).pop(newUser);
                },
                child: Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
