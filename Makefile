#/**
# * TangoMan FullStaff.fr
# *
# * TangoMan Makefile Generator: Run `make` to print help.
# * If you want to add a help message for your rule, just add : "## Foo bar", on the previous line.
# * Use : "### Foobar" to group rules by categories.
# * You can pass arguments with this syntax: `make COMMAND PARAMETER=VALUE`.
# *
# * @version  0.1.0
# * @author   "Matthias Morin" <mat@tangoman.io>
# * @licence  MIT
# * @link     https://github.com/TangoMan75/quiz-trainer
# */

.PHONY: help install run build tests lint deploy clean dev-install

#--------------------------------------------------
# Colors
#--------------------------------------------------

TITLE     = \033[33m
PRIMARY   = \033[97m
SECONDARY = \033[96m
SUCCESS   = \033[92m
DANGER    = \033[31m
WARNING   = \033[93m
INFO      = \033[95m
LIGHT     = \033[47;90m
DARK      = \033[40;37m
MUTED     = \033[37m
PROMPT    = \033[96m
LABEL     = \033[32m
ERROR     = \033[1;31
DEFAULT   = \033[0m
NL        = \033[0m\n

#--------------------------------------------------
# System
#--------------------------------------------------

# Local operating system (Windows_NT, Darwin, Linux)
ifeq ($(OS),Windows_NT)
	SYSTEM=$(OS)
else
	SYSTEM=$(shell uname -s)
endif

#--------------------------------------------------
# Help
#--------------------------------------------------

## Print this help
help:
	@printf "${LIGHT} TangoMan FullStaff.fr ${NL}\n"

	@printf "${TITLE}Description:${NL}"
	@printf "${PRIMARY}  manage HTML project${NL}\n"
	@printf "${PRIMARY}  Project availlable here: https://tangoman75.github.io/fullstaff.fr${NL}\n"

	@printf "${TITLE}Usage:${NL}"
	@printf "${PRIMARY}  make [command]${NL}\n"

	@printf "${TITLE}Commands:${NL}"
	@awk '/^### /{printf"\n${TITLE}%s${NL}",substr($$0,5)} \
	/^[a-zA-Z0-9_-]+:/{HELP="";if(match(PREV,/^## /))HELP=substr(PREV, 4); \
		printf "  ${LABEL}%-12s${DEFAULT} ${PRIMARY}%s${NL}",substr($$1,0,index($$1,":")),HELP \
	}{PREV=$$0}' ${MAKEFILE_LIST}

##################################################
### HTML
##################################################

## Serve at localhost:8080
serve:
	@printf "${INFO}xdg-open http://localhost:8080${NL}"
	@xdg-open http://localhost:8080
	printf "${INFO}php -d memory-limit=-1 -S \"127.0.0.1:8080\" -t \".\"${NL}"; \
	php -d memory-limit=-1 -S "127.0.0.1:8080" -t "."

## Deploy to gh-pages
deploy:
	@( \
		printf "${INFO}git push -f git@github.com:TangoMan75/fullstaff.fr.git master:gh-pages${NL}"; \
		git push -f git@github.com:TangoMan75/fullstaff.fr.git master:gh-pages; \
	)
