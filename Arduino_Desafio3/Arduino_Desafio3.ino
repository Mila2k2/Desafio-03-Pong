const int pot1 = A5;

float valor_pot = 0;

void setup() {
  Serial.begin(9600);
  pinMode(pot1, INPUT);
}

void loop() {
  valor_pot = map(analogRead(pot1),0,1023,0,255);
  delay(100);
  Serial.println(valor_pot);
}
