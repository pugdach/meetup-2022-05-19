# Puppet User Group DACH

Meetup vom 19.05.2022

## Sicheren Puppet Code entwickeln und testen mit PDK

Test vs. Code - bei diesem Meetup stellen wir das Puppet Development Kit (PDK)
vor und gehen darauf ein wie man Tests erstellt, mit dem Control-Repo und Modulen
arbeitet und sinnvolle Teststrategien plant.

## Onceover Testen eines control-repos

Wenn man diesen Beispiel Code nutzen will, muss das control-repo Verzeichnis ein eigenes git repo sein.

    cd control-repo
    git init
    git checkout -b production
    git add --all
    git commit -m 'initial commit'

Jetzt kann man mit onceover weiterarbeiten:

    bundle install
    bundle exec onceover ...

