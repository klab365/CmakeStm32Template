dependency:
	cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o graph.png

fw:
	rm -rf build
	mkdir -p build
	cmake -B build -S . -DPROJECT_VERSION=1.2.3 -DCMAKE_BUILD_TYPE=Release
	cmake --build build

test:
	rm -rf build
	mkdir -p build
	cmake -B build -S tests
	cmake --build build