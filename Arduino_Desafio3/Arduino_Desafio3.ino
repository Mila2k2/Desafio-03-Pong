#define pot1 A0

int valor_pot = 0;

void setup() {
  pinMode(pot1, INPUT);
}

void loop() {
  valor_pot = analogRead(pot1);
  delay(10);
  Serial.println(valor_pot);
}
