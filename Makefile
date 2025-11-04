# === Makefile ===

VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

.PHONY: activate install run test clean all

# Nur eine Hilfs-Message (dauerhaftes Aktivieren geht in make nicht)
activate:
	@echo "Zum Aktivieren im aktuellen Terminal:"
	@echo "  source $(VENV)/bin/activate"

# Erstellt venv falls nötig und updatet pip
$(PYTHON):
	python3 -m venv $(VENV)

start:
	source .venv/bin/activate && which python3 && which pip




# Installiert Requirements in der venv
install: requirements.txt
	python -m pip install -r requirements.txt


# Startet dein Programm mit venv-Python
run: 
	$(PYTHON) main.py

# Unit-Tests (Passe Pfad/Pattern an dein Projekt an)
test: 
	$(PYTHON) -m unittest discover -s tests -p "*_test.py"

# Komfortziel
all: run test

# Aufräumen
clean:
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} +
