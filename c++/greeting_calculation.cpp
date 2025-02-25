/*
Duilio Lucio, CS333, Project 2, 10/03/2024
*/

#include <iostream>
#include <string>

int main() {
    std::string name;
    int favNumber;

    // Ask for name
    std::cout << "Please enter your name: ";
    std::getline(std::cin, name);

    // Ask for favorite number
    std::cout << name << " what's your favorite number? ";
    std::cin >> favNumber;

    // Multiply favorite number by 2
    std::cout << "Your favorite number multiplied by two is: " << favNumber * 2 << "\n";

    // End program
    std::cout << "Thanks for telling me your name" << name << " and your favorite number, have a good day!\n";

    return 0; 

}