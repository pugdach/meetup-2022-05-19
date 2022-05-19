# OnceOver Test Repo

## OnceOver

### Code Quality

    bundle exec onceover run codequality

### Lookup

    bundle exec onceover run lookup --passthru="classes  --merge=deep" --factset spec/factsets/login.training20220427.betadots.training.json
    bundle exec onceover run lookup --passthru="classes  --merge=deep" --factset spec/factsets/puppet.training20220427.betadots.training.json

### spec

    bundle exec onceover run spec

### catatalog-diff

    git checkout -b demo
    # remove some resources from infrastructure::puppet::puppetmaster

    bundle exec onceover run diff -f production -t demo   -c infrastructure::puppet::puppetmaster
    SHOW_PUPPET_OUTPUT=true bundle exec onceover run diff -f production -t demo   -c infrastructure::puppet::puppetmaster

## Rubocop

    bundle exec rubocop

