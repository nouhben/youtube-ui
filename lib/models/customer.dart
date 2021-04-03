/// The customer reference contains phone number address and other settings
/// It is created once after signing up for the first time then linked to our user
/// we need to later let the user update the phone and his address
class CustomUser {
  const CustomUser({
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.subscribers,
  });
  final String name, email;
  final String profileImageUrl;
  final String subscribers;
}
