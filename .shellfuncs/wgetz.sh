function wgetz {
  wget -O /dev/stdout "$1" | tar -xz
}
