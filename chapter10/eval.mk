#this is a eval func test

PROGRAMS = server client
server_OBJS = server.o server_pri.o server_access.o
server_LIBS = priv protocol

client_OBJS = client.o client_api.o client_mem.o
client_LIBS = protocol

.PHONY:all

all:$(PROGRAMS)

define PROGRAM_template
$(1):$$($(1)_OBJS) $$($(1)_LIBS:%=-l%)
ALL_OBJS += $$($(1)_OBJS)
endef

$(foreach prog,$(PROGRAMS),$(eval $(call PROGRAM_template,$(prog))))

$(PROGRAMS):
	$(LINK.o) $^ $(LDLIBS) -o $@

clean:
	rm -f $(ALL_OBJS) $(PROGRAMS)
