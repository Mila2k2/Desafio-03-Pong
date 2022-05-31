const int pot1 = A5;

const int b01 = 9;
const int b02 = 8;
const int b03 = 7;
const int b04 = 6;

float valor_pot = 0;

bool v_b01;
bool v_b02;
bool v_b03;
bool v_b04;

void setup() {
  Serial.begin(9600);
  pinMode(pot1, INPUT);
  for(int i = 6; i <= 9; i++){
      pinMode(i, INPUT);
    }
}

void loop() {
  //valor_pot = map(analogRead(pot1),0,1023,0,255);
  //Serial.println(valor_pot);
  v_b01 = digitalRead(b01);
  delay(100);
  Serial.println(v_b01);
}
