AS = nasm 
ASFLAGS = -f elf64

LD = ld
LDFLAGS = -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2

OBJDIR = obj

COLLEEN_SRC = Colleen/Colleen.s
GRACE_SRC   = Grace/Grace.s
SULLY_SRC   = Sully/Sully.s

COLLEEN_OBJ = $(OBJDIR)/Colleen.o
GRACE_OBJ   = $(OBJDIR)/Grace.o
SULLY_OBJ   = $(OBJDIR)/Sully.o

COLLEEN_EXE = Colleen/Colleen
GRACE_EXE   = Grace/Grace
SULLY_EXE   = Sully/Sully

all: $(OBJDIR) $(COLLEEN_EXE) $(GRACE_EXE) $(SULLY_EXE)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(COLLEEN_OBJ): $(COLLEEN_SRC) | $(OBJDIR)
	$(AS) $(ASFLAGS) $< -o $@

$(GRACE_OBJ): $(GRACE_SRC) | $(OBJDIR)
	$(AS) $(ASFLAGS) $< -o $@

$(SULLY_OBJ): $(SULLY_SRC) | $(OBJDIR)
	$(AS) $(ASFLAGS) $< -o $@

$(COLLEEN_EXE): $(COLLEEN_OBJ)
	$(LD) $< -o $@ $(LDFLAGS)

$(GRACE_EXE): $(GRACE_OBJ)
	$(LD) $< -o $@ $(LDFLAGS)

$(SULLY_EXE): $(SULLY_OBJ)
	$(LD) $< -o $@ $(LDFLAGS)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(COLLEEN_EXE) $(GRACE_EXE) $(SULLY_EXE)

re: fclean all