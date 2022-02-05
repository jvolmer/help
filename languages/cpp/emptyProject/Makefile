CXX      = g++
CXXFLAGS = -Wall -std=c++14 -Wno-deprecated-declarations -MMD
LDFLAGS  = -lm
LDFLAGSTEST = -lboost_unit_test_framework
INCTEST = -I /home/jvolmer/bin/turtle_1.3.1/include

SOURCES = example.cpp
TARGETS = main.x
OBJECTS = example.o

TESTS = example.test
INTTESTS = 
TESTOBJECTS = test_example.o

all: $(TARGETS)

tests : $(TESTS)

# create targets
main.x : main.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)


# create tests
%.test : test_%.o %.o
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGSTEST) $(LDFLAGS)
	@echo Running $@
	@./$@ #--log_level=test_suite
	@echo 

# create test objetcs
test_%.o : test_%.cpp
	$(CXX) $(CXXFLAGS) $< -c -o $@ $(INCTEST)


# use .d (dependency) files for prerequisite generation
DEPFILES := $(SOURCES:.cpp=.d)
$(DEPFILES):
include $(wildcard $(DEPFILES))

clean : 
	rm -f *.x *.o *.test *.d

# targets that are not files
.PHONY : all tests clean

# prevents that intermediate files are removed automatically
# (some objects are never used explicitly as target or prerequisite,
# due to usage of implicit rules)
.SECONDARY : $(TESTOBJECTS) $(OBJECTS)
