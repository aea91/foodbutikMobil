part of 'login_view.dart';

class _RegisterTextButton extends StatelessWidget {
  const _RegisterTextButton();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "Register",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoManager.instance.push(path: NavigationConstants.register);
              },
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.read<LoginCubit>().login(), child: Text("Login"));
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<LoginCubit>().setPassword(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return value.isValidPassword("Please enter a valid password");
      },
      decoration: InputDecoration(hintText: 'Password'),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<LoginCubit>().setEmail(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return value.isValidEmail("Please enter a valid email");
      },
      decoration: InputDecoration(hintText: 'Email'),
    );
  }
}
