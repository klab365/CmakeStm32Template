dependency:
	cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o graph.png

fw:
	rm -rf build
	mkdir -p build
	cmake -B build -S . -DPROJECT_VERSION=1.2.3 -D CMAKE_TOOLCHAIN_FILE=cmake/gcc-arm-none-eabi.cmake -DCMAKE_BUILD_TYPE=Release
	cmake --build build

host:
	rm -rf build
	mkdir -p build
	cmake -B build -S .
	cmake --build build
	