# meetup

## Create the module

```bash
pdk new module meetup
cd meetup
````

## Klassen, defined Types usw. anlegen

Die folgenden Ausführeung zeigen wie die Klassen usw. erstellt wweden können. Die folgenden Befehle sind bereits ausgeführt und führen bei erneuter Ausführung zu Fehlermeldungen, da die entsprechenen Klassen usw. schon vorhanden sind.

```bash
pdk new class meetup
pdk new class service

pdk new defined_type parent_dirs
pdk new defined_type sec_test

pdk new function hex_ip
pdk new fact meetup_test
pdk new task testtask
pdk new provider meetup_provider
```

## Ausführen der Validierung

```bash
pdk validate
```

pdk validate führt zu einem Fehler, da der defined type `sec_test` eine Sicherheitslücke enthält. Die Datei `sec_test_secure.pp` enthält den verbesserten Code.

## Auaführen der Unit Tests

```bash
pdk test unit -v
pdk test unit --parallel   # parallele Ausführung der Unit Tests
```

## PDK updaten

Die Datei `.sync.yml` ist bereits entsprechend erstellt. ein `pdk update`meldet daher `No changes required.`

