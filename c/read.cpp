#include <fstream>
#include <ios>
#include <iostream>
#include <iterator>
#include <vector>
#include <memory>
#include <utility>

std::vector<char> read_entire_stream(std::istream& input) {
	std::istreambuf_iterator<char> begin{input};
	std::istreambuf_iterator<char> end{};
	return std::vector<char>{begin, end};

}

int main(int argc, char* argv[]) {
	std::vector<char> memory;
	if (argc <= 1) {
		memory = read_entire_stream(std::cin);
	}
	else {
		for(int i = 1; i < argc; i++) {
			std::ifstream file{argv[i], std::ios::binary | std::ios::in};
			auto tmp = read_entire_stream(file);
			memory.insert(memory.end(), tmp.begin(), tmp.end());
		}
	}
	for (const auto& element : memory)
		std::cout << element;
}