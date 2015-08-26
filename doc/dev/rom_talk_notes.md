Introduction to ROM
====

Or, How to survive 50 kLoC.

rails new --skip-spring --skip-turbolinks \
  --skip-test-unit --skip-active-record \
  --database postgresql cgl

1. how many people have used
  - MVC?
  - AR?
1. patterns
  1. activerecord
  1. datamapper
    1. comparison to activerecord
      - http://rom-rb.org/introduction/activerecord/
      - rom separates domain from persistence
1. design of rom
  1. adapter
  1. gateway
  1. command
    - "Commands are an object-oriented replacement for callbacks"
      (Gamma et al., Design Patterns, 1995, p. 235)
    - "I personally find callbacks to be an anti-pattern"
      (Perham, M., Ruby Rogues ep. 221, 20:19)
    - "Callbacks are the devil"
      (Ehmke, C. A., Ruby Rogues ep. 221, 20:22)
1. setting expectations
  1. organization is verbose
    - the address to your house is longer than the address to
      your city
    - there's gonna be more code
    - but .. SRP
  1. LoC per feature
    - Ideally, LoC should be logarithmically related to # features
    - In practice, in AR, LoC is exponentially related to # features, IMHO
      - When software design violates SRP, code reuse suffers
      - We're afraid to reuse complex stuff, leading to duplication
      - It's possible to do AR right!
    - ROM seems to introduce one specific type of duplication, model attributes
      - ROM duplicates in migration, mapper, and model
      - AR duplicates in migration and model
  1. rom is experimental (not 1.0 yet)
    - but it's not new, it's at least two years old
    - http://devchat.tv/ruby-rogues/123-rr-rom-with-piotr-solnica
      - Published: 2013-09
  1. nothing is easy to use
    - don't believe anyone who tells you their thing is easy to use
    - it's easy for them
    - things only become easy to use after millions of people have
      used them
  1. I've spent 5 years (conservatively 4,000 hours) using AR
    - about 4 hours using ROM
    - so, of course it's hard
1. about the project
  1. previous project: datamapper
    - but datamapper doesn't follow data mapper pattern well
  1. Piotr Solnica
    - From Poland, living in Spain (CET)
    - super helpful
1. migrations are different
  - http://rom-rb.org/guides/adapters/sql/
  - rake task, not rails command
    - bin/rake db:create_migration[create_cards]
    - you literally use square brackets, wtf
    - i think piotr is in love with square brackets
  - sequel, not AR
    - datatypes: http://sequel.jeremyevans.net/rdoc/files/doc/schema_modification_rdoc.html
  - missing rake tasks
    - db:drop
      - use pg tool: dropdb
    - db:rollback
      - wtf
      - we can dropdb && createdb && migrate && pg_dump ... but wtf
    - db:structure:dump
      - use sequel -D postgres://host/database
      - or just learn your database tool, like pg_dump
        - pg_dump --schema-only [db] > db/structure.sql
  - sidebar: this is why to learn SQL, because migration syntax
    will change, but SQL DDL will not.
1. generators

```
bin/rails g rom:relation cards
      create  app/relations/cards_relation.rb
bin/rails g rom:mapper cards
      create  app/mappers/card_mapper.rb
bin/rails g rom:commands cards
      create  app/commands/card_commands/create.rb
      create  app/commands/card_commands/update.rb
      create  app/commands/card_commands/delete.rb
```

1. sidebar: why are half of tools in `bin/rails` and half in `bin/rake`?
1. create a card

```
rom = ROM.env
rom.command(:cards).create.call([{ name: 'Annoy-o-Tron' }])
```

1. Testing
  - Can't seem to use database.yml?
    - rom-rails has rom/rails/active_record/configuration.rb
      which may be able to, but it depends on active_record,
      which I'd be crazy to use just to parse a yml file.
    - solution: dotenv for multiple environments
    - using DATABASE_URL works well when it comes time to deploy to heroku
  - Can't `use_transactional_fixtures`
    - no problem, use DatabaseCleaner
1. No automatic record timestamps
  - created_at, updated_at
  - not hard to implement, but why should we have to?
1. No official support from devise
  - devise only has built-in support for AR and Mongoid
1. Works fine with ActiveModel
  - which means it should work fine in controllers and views
1. Built on Sequel
  - What are differences to arel?
1. Pipeline
  - Mappers and Relations are composable in arbitrary order!
1. Related projects
  - Lotus (http://lotusrb.org)
  - Trailblazer

1. Criticism
  1. Documentation is out-of-date and often wrong
    1. tutorial uses rom 0.6, latest is 0.9
    1. setup in rails is not well documented
      - where does ROM.setup go?
      - you have to add initializers/rom.rb but no one tells you that
  1. Error messages are not helpful

  ```
  # works
  ROM.env.command(:users).as(:user).create.call
  # raises ROM::MapperMissingError
  ROM.env.command(:users).create.as(:user).call
  ```

  1. API can be inconsistent
    - Example: composing with a mapper
      - Can chain either `as` or `map_with` on a relation
      - Can only chain `as` on a command, `map_with` raises `NoMethodError`
