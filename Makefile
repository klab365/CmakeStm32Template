dependency:
	mkdir -p build
	cd build 
	cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o graph.png

fw:
	mkdir -p build
	cmake -B build -S . -DPROJECT_VERSION=1.2.3 -D CMAKE_TOOLCHAIN_FILE=cmake/gcc-arm.cmake -DCMAKE_BUILD_TYPE=Release
	cmake --build build

host:
	mkdir -p build
	cmake -B build -S .
	cmake --build build

clean:
	rm -rf build
