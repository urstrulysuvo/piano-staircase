#define ldr  A1
#define led   0
#define out   1
int ldr_read, input = 0, prevInput = 0;

void setup() {    
  pinMode(led,OUTPUT);    
  pinMode(out,OUTPUT);
  digitalWrite(led,0);
  analogWrite(out,0);
  pinMode(ldr,INPUT);
}

void loop() {
  if(is_active() == 1)
    analogWrite(out,165);
  else
    analogWrite(out,0);
  delay(50);
}

int is_active() {
  input = 0;
  if(analogRead(ldr) < 500){
    digitalWrite(led, 1);
    input = 1;
  } else 
    digitalWrite(led, 0);
  if(prevInput != input){
    prevInput = input;
    return input;
  }
  return 0;
}
