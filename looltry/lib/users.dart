// Define a class for the user object
class User {
  String username;
  String email;
  String password;

  User({required this.username, required this.email, required this.password});
}

void main() {
  // Create a list to store the users
  List<User> users = [];

  // Function to check if the username is valid
  bool isUsernameValid(String username) {
    // Check if the username is not empty and has at least 6 characters
    return username.isNotEmpty && username.length >= 6;
  }

  // Function to check if the email is valid
  bool isEmailValid(String email) {
    // Use a regular expression to check if the email is in the proper format
    String emailRegex =
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
    RegExp emailRegExp = RegExp(emailRegex);
    return email.isNotEmpty && emailRegExp.hasMatch(email);
  }

  // Function to check if the password is valid
  bool isPasswordValid(String password) {
    // Check if the password is not empty and has at least 8 characters
    return password.isNotEmpty && password.length >= 8;
  }

  // Function to check if the username, email, and password are all valid
  bool isValid(String username, String email, String password) {
    return isUsernameValid(username) &&
        isEmailValid(email) &&
        isPasswordValid(password);
  }

  // Function to create a new user and add it to the list
  void createUser(String username, String email, String password) {
    if (isValid(username, email, password)) {
      // Create a new user object
      User newUser = User(username: username, email: email, password: password);

      // Add the user to the list
      users.add(newUser);
    } else {
      // Print an error message if the username, email, or password is invalid
      print("Invalid username, email, or password");
    }
  }
}
