import 'package:plantilla_usuarios/model/model.dart';
import 'package:plantilla_usuarios/provider/provider.dart';
import 'package:plantilla_usuarios/screens/screens.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserDetailsScreen extends StatelessWidget {
  final Usuarios usuarios;

  const UserDetailsScreen({required this.usuarios});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildUserImage(),
          ),
          Divider(),
          ListTile(
            title: Text('Name'),
            subtitle: Text(usuarios.name),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(usuarios.email),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text(usuarios.addres),
          ),
          ListTile(
            title: Text('Phone'),
            subtitle: Text(usuarios.phone),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Eliminar Usuario'),
                content: Text(
                    'Vas a eliminar al usuario ${usuarios.name}, ¿Estás seguro?'),
                actions: [
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Eliminar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      userProvider.removeUser(usuarios);
                      //para retornar a la pantalla cuando eliminamos un usuario
                      Navigator.popUntil(context, ModalRoute.withName('home'));
                      //Navigator.of(context).pop(usuarios);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  //creamos un widget por si el usuario no tiene imagen nos retorne un icono.
  Widget _buildUserImage() {
    if (usuarios.photo != null && usuarios.photo.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: usuarios.photo,
        width: 500.0,
        height: 300.0,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } else {
      return const Icon(
        Icons.account_circle,
        size: 300.0,
        color: Colors.blueAccent,
      );
    }
  }
}
