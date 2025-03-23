String readThermometer() {
  print("Reading temperature...");
  return "30°C";
}

late String temperature = readThermometer();  // Won't run until accessed
