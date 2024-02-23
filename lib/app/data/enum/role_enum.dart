enum Role {
  client,
  owner;

  @override
  String toString() {
    if (name == "miniSoccer") {
      return "Mini Soccer";
    }

    return name[0].toUpperCase() + name.substring(1);
  }
}
