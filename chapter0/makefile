.PHONY:all clean depen

depen=clean main.o add_minus.o libadd_minus.a libmulti_div.so

all:$(depen)
	gcc -o main main.o -L./ -ladd_minus -lmulti_div

main.o:main.c
	gcc -c main.c

add_minus.o:
	gcc -c add_minus.c

libadd_minus.a:add_minus.o
	ar rc libadd_minus.a add_minus.o

libmulti_div.so:
	gcc multi_div.c -fPIC -shared -o libmulti_div.so

clean:
	-rm $(depen) main 
