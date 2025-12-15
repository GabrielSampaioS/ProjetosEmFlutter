import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/view_models/auth_view_model.dart';
import '../../preferences/preferences_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/modules_data.dart';
import '../../../models/module_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final modules = appModules(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF032B3A),
                    Color(0xFF0A8EC7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/nome.png',
                  height: 80,
                  //color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),

            // ---- LISTA DE ITENS DO DRAWER ----

            ListTile(
              leading: Icon(Icons.feed, color: colors.primary),
              title:
                  Text('Lançamentos', style: TextStyle(color: colors.primary)),
              onTap: () => Navigator.pop(context),
            ),

            ListTile(
              leading: Icon(Icons.settings, color: colors.primary),
              title:
                  Text('Preferências', style: TextStyle(color: colors.primary)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PreferencesScreen()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.logout, color: colors.primary),
              title: Text('Logout', style: TextStyle(color: colors.primary)),
              onTap: () async {
                Navigator.pop(context);
                final authViewModel = context.read<AuthViewModel>();
                await authViewModel.logout();

                if (context.mounted) {
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              },
            ),
          ],
        ),
      ),

      // ------------------ APPBAR ------------------
      appBar: AppBar(
        iconTheme: IconThemeData(color: colors.onSecondary),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_image.png',
          height: 40,
          color: colors.onSecondary,
        ),

        // GRADIENTE
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF032B3A),
                Color(0xFF0A8EC7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      // ------------------ BODY --------------------
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categorias",
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: modules.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final ModuleItem module = modules[index];
                  return _buildModuleCard(context, module);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // ------------------ CARD DOS MÓDULOS ------------------
  Widget _buildModuleCard(BuildContext context, ModuleItem module) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => module.onTap(),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors.primary, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              module.SvgPicturePath,
              width: 50,
              height: 50,
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            const SizedBox(height: 10),
            Text(
              module.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
