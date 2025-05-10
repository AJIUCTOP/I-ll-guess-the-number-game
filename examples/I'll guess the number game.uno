unsigned long lowerBound = 0; // Lower bound
unsigned long upperBound = 99999; // The upper limit for a five-digit number
unsigned long guess; // Estimated number
of int attempts = 0; // Number of attempts
bool firstGuess = true; // Flag for the first guess
int firstResponse = -1; // Variable for storing the first response (-1 - not specified)

void setup() {
Serial.begin(9600);
Serial.println("Enter a number from 00000 to 99999:");
}

void loop() {
if (Serial.available() > 0) { // Checking if there is data in the serial port
if (firstGuess) {
unsigned long target = Serial.parseInt(); // Reading the entered number
Serial.print("Looking for a number: ");
Serial.println(target);
lowerBound = 0; // Reset borders and attempts before starting the search    
upperBound = 99999; // Reset borders and attempts before starting the search
attempts = 0; // Reset borders and attempts before starting the search
firstGuess = false; // Setting the flag that the first assumption is made
} else {
// Performing a binary search
while (lowerBound <= upperBound) {
guess = (lowerBound + upperBound) / 2; // Find the average value
Serial.print("Attempt:");
Serial.println(guess);
attempts++;
// Waiting until the user enters more, less, or found
Serial.println("Enter '.' for 'greater than', ',' for 'less than' or '/' if a number is found:");
while (true) {
if (Serial.available() > 0) {
char input = Serial.read(); // Read
the if symbol (input == '.') {
Serial.println("More");
if (firstResponse == -1) { // If this is the first response
firstResponse = 1; // We establish that the first guess is greater
}
lowerBound = guess + 1; // We increase the lower bound
break; // Exiting the inner loop
} else if (input == ',') {
Serial.println("Less");
if (firstResponse == -1) { // If this is the first response
firstResponse = 0; // We establish that the first guess is less
than }
upperBound = guess - 1; // We reduce the upper bound
break; // Exiting the inner loop
} else if (input == '/') {
Serial.print("Number found! ");
Serial.print("Result of the first response: ");
Serial.println(firstResponse);
Serial.print("Number of attempts: ");
Serial.println(attempts);
// Resetting the state for the next number
firstGuess = true; // Resetting the flag for the next number
firstResponse = -1; // Resetting the result of the first response
attempts = 0; // Reset the number
of return attempts; // Exit the function to wait for a new input
} else {
Serial.println("Invalid input. Use '.' for 'greater than', ',' for 'less than' or '/' if a number is found.");
}
}
}
}
// If the number is not found
if (lowerBound > upperBound) {
Serial.println("The number was not found in the specified range.");
}
// Waiting for the user to enter a new number
Serial.println("Enter a new number from 00000 to 99999:");
firstGuess = true; // Resetting the flag for the next number
firstResponse = -1; // Resetting the result of the first response
attempts = 0; // Resetting the number of attempts
}
}
}