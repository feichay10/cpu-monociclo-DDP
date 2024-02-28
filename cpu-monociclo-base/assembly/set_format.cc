/**
 * @file set_format.cc
 * @author your name (you@domain.com)
 * @brief Codigo que pone el formato de codigo binario
 * Por cada 4 bits se pone un '_' para separar
 * @version 0.1
 * @date 2024-02-28
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include <iostream>
#include <fstream>

int main(int argc, char* argv[]) {
  if (argc != 2) {
    std::cerr << "Usage: " << argv[0] << " <binary_file>" << std::endl;
    exit(EXIT_FAILURE);
  }

  std::string binary_file = argv[1];
  std::ifstream file(binary_file, std::ios::binary);
  if (!file.is_open()) {
    std::cerr << "Error: could not open file " << binary_file << std::endl;
    exit(EXIT_FAILURE);
  }

  std::string binary;
  file.close();

  // set to another file formatted
  std::ofstream file_formatted(binary_file + "_formatted");
  file.open(binary_file, std::ios::binary);
  if (!file.is_open()) {
    std::cerr << "Error: could not open file " << binary_file << std::endl;
    exit(EXIT_FAILURE);
  }

  // si encuentra la ultima posicion de la linea no pone el _
  while(getline(file, binary, '\n')) {
    for (size_t i = 0; i < binary.size(); i++) {
      file_formatted << binary[i];
      if (i % 4 == 3 && i != binary.size() - 1) {
        file_formatted << "_";
      }
    }
    file_formatted << std::endl;
  }

}