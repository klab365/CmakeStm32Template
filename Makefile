dependency:
	cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o graph.png

fw:
	cmake -B build -S . -DPROJECT_VERSION=1.2.3 -D CMAKE_TOOLCHAIN_FILE=cmake/gcc-arm.cmake -DCMAKE_BUILD_TYPE=Release
	cmake --build build

host:
	cmake -B build -S .
	cmake --build build

clean:
	rm -rf build
	mkdir -p build