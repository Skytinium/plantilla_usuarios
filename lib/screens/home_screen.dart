import 'package:plantilla_usuarios/provider/provider.dart';
import 'package:plantilla_usuarios/screens/screens.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    print(userProvider.usuarios);
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userProvider.usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UserDetailsScreen(usuarios: userProvider.usuarios[index]),
                ),
              );
            },
            title: Text(userProvider.usuarios[index].name),
            subtitle: Text(userProvider.usuarios[index].email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateUserScreen(),
            ),
          ).then((newUser) {
            if (newUser != null) {
              userProvider.addUser(newUser);
              //para retornar a la pantalla cuando agregamos un usuario
              Navigator.popUntil(context, ModalRoute.withName('home'));
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




  /*  final List<Usuarios> usuarios = [
    Usuarios(
      name: "Leanne Graham",
      email: "Sincere@april.biz",
      addres: "-37.3159,81.1496",
      phone: 678123456,
      photo:
          "https://cadena100-cdnmed.agilecontent.com/resources/jpg/1/3/1613997591631.jpg",
    ),
    // Agrega más usuarios aquí
  ]; */