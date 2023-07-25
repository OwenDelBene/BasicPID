TARGET := PID_Test

BUILD_DIR := build
SRC_DIR := src


CC := gcc 


CFLAGS = -I ./include

SRCS:= $(shell find $(SRC_DIR) -name '*.c')
OBJS := $(SRCS:src/%.c=$(BUILD_DIR)/%.o)

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
		rm -r $(BUILD_DIR)/*


$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
		@mkdir -p $(dir $@)
			@echo "Building $<"
				@$(CXX) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
		@echo "Linking $(TARGET)"
			@$(CXX) $(CFLAGS) -o $@ $^ $(LDFLAGS)
