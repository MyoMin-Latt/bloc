Future<String> getString() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'This is data from Server';
}
