import 'package:flutter/material.dart';
import 'package:client/core/localization/bloc/locale_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/core/design_system/theme_extension/app_theme_extension.dart';
import 'package:client/core/design_system/theme_extension/theme_manager.dart';





class FlutterBunnyScreen extends StatefulWidget {
  const FlutterBunnyScreen({Key? key}) : super(key: key);

  @override
  State<FlutterBunnyScreen> createState() => _FlutterBunnyScreenState();
}

class _FlutterBunnyScreenState extends State<FlutterBunnyScreen> {
  

  @override
  void initState() {
    super.initState();
    
  }


 

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colors.surface,
      appBar: AppBar(
        title: Text(
          'Client',
          style: context.theme.fonts.headerLarger.copyWith(fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme Section
              _buildThemeSection(),
              
              const SizedBox(height: 30),

              
              
              

              
            ],
          ),
        ),
      ),
    );
  }


    Widget _buildThemeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.palette_outlined,
              color: context.theme.colors.activeButton,
              size: 26,
            ),
            const SizedBox(width: 12),
            Text(
           Theme,
              style: context.theme.fonts.headerLarger.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.theme.colors.surfaceCard,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildThemeModeButton(
                  ThemeModeEnum.light,
                  Icons.light_mode,
                   Light Mode,
                ),
                const SizedBox(width: 12),
                _buildThemeModeButton(
                  ThemeModeEnum.dark,
                  Icons.dark_mode,
                  Dark Mode,
                ),
                const SizedBox(width: 12),
                _buildThemeModeButton(
                  ThemeModeEnum.system,
                  Icons.brightness_auto,
               System Mode,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  
    Widget _buildThemeModeButton(ThemeModeEnum mode, IconData icon, String label) {
    final isSelected = context.watch<ThemeCubit>().state.themeMode == mode;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<ThemeCubit>().setTheme(mode);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? context.theme.colors.activeButton
                : context.theme.colors.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: context.theme.colors.activeButton.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected
                    ? context.theme.colors.textWhite
                    : context.theme.colors.textPrimary,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? context.theme.colors.textWhite
                      : context.theme.colors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }


  

  

  
}
