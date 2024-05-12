prog: main.o bg.o game.o 
	gcc game.o bg.o main.o -o prog -lSDL -lSDL_image -lSDL_mixer -lSDL_ttf -lm

main.o: main.c
	gcc -c main.c -g

bg.o: bg.c 
	gcc -c bg.c -g

game.o: game.c 
	gcc -c game.c -g

enigme: MainEnigme.o enigme.o
	gcc MainEnigme.o enigme.o -o enigme -lSDL -lSDL_image -lSDL_mixer -lSDL_ttf -g
	rm *.o
	./enigme

MainEnigme.o: MainEnigme.c
	gcc MainEnigme.c -c -lSDL -lSDL_image -lSDL_mixer -lSDL_ttf -g

enigme.o: enigme.c
	gcc enigme.c -c -lSDL -lSDL_image -lSDL_mixer -lSDL_ttf -g

clean:
	rm -f *.o prog enigme

run: prog enigme
	./prog

