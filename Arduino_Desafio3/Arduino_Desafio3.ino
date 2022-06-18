const int pot1 = A5;
const int pot2 = A3;

const int b01 = 9;
const int b02 = 8;
const int b03 = 7;
const int b04 = 6;

float valor_pot1 = 0;
float valor_pot2 = 0;

bool v_b01;
bool v_b02;
bool v_b03;
bool v_b04;

int arr[10];

void setup() {
  Serial.begin(9600);
  pinMode(pot1, INPUT);
  pinMode(pot2, INPUT);
  
  for(int i = 6; i <= 9; i++){
      pinMode(i, INPUT_PULLUP);
    }
}

void loop() {
  valor_pot1 = map(analogRead(pot1),0,1023,0,255);
  Serial.print(String(valor_pot1) + " - ");
  
  valor_pot2 = map(analogRead(pot2),0,1023,0,255);
  Serial.print(String(valor_pot2) + " - ");
  
  v_b01 = !digitalRead(b01);
  v_b02 = !digitalRead(b02);

  v_b03 = !digitalRead(b03);
  v_b04 = !digitalRead(b04);

  Serial.print(String(v_b01) + " - ");
  Serial.print(String(v_b02) + " - ");
  Serial.print(String(v_b03) + " - ");
  Serial.print(String(v_b04) + "\n");
  delay(500);
}
