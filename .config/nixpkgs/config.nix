(import ./config.dev.nix) // {
  # Add your own config here, and it will take priority over the stuff provided by dev.
  permittedInsecurePackages = [
    "openssl-1.0.2u"
  ];
}
