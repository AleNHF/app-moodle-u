import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';
import 'package:uagrm_app_moodle/viewmodels/auth_viewmodel.dart';
import 'package:uagrm_app_moodle/views/auth/utils/auth_background.dart';
import 'package:uagrm_app_moodle/views/auth/utils/card_container.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Stack(
          children: [
            Container(
              color: Colors.red.withOpacity(0.3),
            ),
            Positioned(
              bottom: 0,
              child: CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    
                    Text(
                      'Iniciar Sesión',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    
                    SizedBox(height: 30),
                    
                    ChangeNotifierProvider(
                      create: ( _ ) => AuthViewModel(),
                      child: _LoginForm()
                    ),
                    
                    SizedBox(height: 30),
                    
                    const Text(
                      '¿Olvidó su contraseña?',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),

                    SizedBox(height: 20)
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<AuthViewModel>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Registro',
            ),
            onChanged: (value) => loginForm.register = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su registro';
              }
              return null;
            },
          ),
          
          SizedBox(height: 20),

          TextFormField(
            autocorrect: false,
            obscureText: !loginForm.showPassword, 
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(loginForm.showPassword
                  ? Icons.visibility
                  : Icons.visibility_off),
                onPressed: loginForm.togglePasswordVisibility
              ),
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: loginForm.isLoading ? null : () async {
              FocusScope.of(context).unfocus();

              if( !loginForm.isValidForm() ) return;
              
              loginForm.isLoading = true;

              await loginForm.authenticate();
              if (loginForm.errorMessage == null) {
                Navigator.pushReplacementNamed(context, 'home');
              } else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(loginForm.errorMessage!))
                );
                loginForm.isLoading = false;
              }
            },
            child: Text(
              loginForm.isLoading
              ? 'Accediendo...'
              : 'Acceder', 
              style: TextStyle(color: AppColors.optionalColor),
            ), 
          ),
        ],
      ),
    );
  }
}

