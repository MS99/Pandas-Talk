# Pandas Talk Makefile

NOTEBOOK= Customers.ipynb

PYTHON3= python3
VENV= .venv
PIP=  $(PYTHON3) -m pip
UPDATE_PIP= $(PIP) install -U pip
INSTALL_REQUIREMENTS= $(PIP) install -Ur requirements.txt
ACTIVATE_VENV= . $(VENV)/bin/activate
LOG= jupyter.log

all:
	@echo
	@echo '-- Pandas Talk Makefile Targets --'
	@echo
	@echo 'install - Install Jupyter Notebook into a VENV '
	@echo 'start   - Start the Jupyter Notebook Server.'
	@echo
	@echo '<EOM>'

$(VENV):
	$(PYTHON3) -m venv --prompt Pandas $(VENV)

install: $(VENV)
	$(ACTIVATE_VENV) && $(UPDATE_PIP) && $(INSTALL_REQUIREMENTS)

start: install
	$(ACTIVATE_VENV) && jupyter notebook $(NOTEBOOK) >& $(LOG)

readme: readme.html

readme.html: README.md
	pandoc README.md -so readme.html; open readme.html

clean:
	@/bin/rm -f readme.html $(LOG)
