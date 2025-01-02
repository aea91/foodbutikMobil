part of 'register_view.dart';

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "Login",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Login tap action
              },
          ),
        ],
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => false,
      child: Text("Register"),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<RegisterCubit>().setPhone(value),
      validator: (value) {
        if (value!.isEmpty) {
          return "Phone is required";
        }
        return value.isValidPhoneNumber("Invalid phone number");
      },
      decoration: InputDecoration(labelText: "Phone"),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<RegisterCubit>().setPassword(value),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        }
        return value.isValidPassword("Invalid password format");
      },
      decoration: InputDecoration(labelText: "Password"),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<RegisterCubit>().setEmail(value),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        }
        return value.isValidEmail("Invalid email format");
      },
      decoration: InputDecoration(labelText: "Email"),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<RegisterCubit>().setName(value),
      validator: (value) => value!.isEmpty ? "Name is required" : null,
      decoration: InputDecoration(labelText: "Name"),
    );
  }
}
