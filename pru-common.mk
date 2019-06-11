CC  := pru-gcc
CXX := pru-g++

CPPFLAGS += -Os
CPPFLAGS += -MMD -MP -MF $@.d
CFLAGS   += -std=gnu11
CXXFLAGS += -std=c++17

#CPPFLAGS += -Ipru-software-support-package/include

.PHONY: elf
elf: $(BUILD)/$(ELF)
$(BUILD)/$(ELF): $(OBJ)
	$(CXX) $(CPPFLAGS) $^ $(LDFLAGS) $(LDLIBS) -o $@

-include $(OBJ:%.o=%.o.d)
.PHONY: %.d

$(BUILD)/%.c.o: %.c
	mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BUILD)/%.cpp.o: %.cpp
	mkdir -p $(@D)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@