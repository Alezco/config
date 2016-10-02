CXX = g++
CXXFLAGS = -std=c++14 -pedantic -Wall -Wextra -Werror -g
LDLIBS = -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
SRC = trollock.cc
OBJ = $(SRC:.cc=.o)
PROJECTNAME = trollock

all : $(OBJ)
	$(CXX) $(CXXFLAGS) -o $(PROJECTNAME) $^ $(LDLIBS)

clean :
	$(RM) $(OBJ) $(PROJECTNAME)

check : all
	./$(PROJECTNAME)

.PHONY : all clean check
