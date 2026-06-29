# Brain Bugs

Brain Bugs is a standalone Jekyll/GitHub Pages site for learning logical fallacies, cognitive biases, heuristics, decision traps, and other thinking errors in plain English.

## Local Development

```bash
bundle install
npm ci
bundle exec jekyll serve
```

## Validation

```bash
make build
make qa
npm run test:a11y
```

## Content Model

- `_bb_errors/` contains individual lessons.
- `_bb_topics/` contains topic/category hubs.
- `_bb_compare/` contains side-by-side comparison pages.
- `_bb_practice/` contains quiz sets.
- `_bb_stories/` contains story guide pages.
- `_data/bb-site.yml`, `_data/bb-categories.yml`, and `_data/bb-practice.yml` drive navigation, taxonomy, and scenario practice.
- `notes/under-development/` contains migrated project planning notes and is excluded from the generated site.

The site serves from the root path `/`.