SRC = ./src/*.c
OBJ = ./lib/*.o
%.o:$(SRC)
	gcc -c $(SRC) -I ./include
	mv *.o ./lib

libcal.a: $(OBJ)
	ar rcs $@ $^
	mv $@ ./lib
	gcc main.c -I ./include -L ./lib -l:libcal.a -o main

.PHONY: clean
clean:
	rm main
	rm -rf ./lib/*
