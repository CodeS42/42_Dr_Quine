CC = clang
CFLAGS = -Wall -Wextra -Werror

OBJDIR = obj

COLLEEN_SRC = Colleen/Colleen.c
GRACE_SRC   = Grace/Grace.c
SULLY_SRC   = Sully/Sully.c

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
	$(CC) $(CFLAGS) -c $< -o $@

$(GRACE_OBJ): $(GRACE_SRC) | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(SULLY_OBJ): $(SULLY_SRC) | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(COLLEEN_EXE): $(COLLEEN_OBJ)
	$(CC) $< -o $@

$(GRACE_EXE): $(GRACE_OBJ)
	$(CC) $< -o $@

$(SULLY_EXE): $(SULLY_OBJ)
	$(CC) $< -o $@

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(COLLEEN_EXE) $(GRACE_EXE) $(SULLY_EXE)

re: fclean all
