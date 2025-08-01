#!/bin/bash
# -----------------------------------------------------------------------------
# Installation script for Jekyll
# -----------------------------------------------------------------------------
# Install Ruby 3.2.2
rbenv install 3.2.2

# Set Ruby 3.2.2 for the current project directory
cd ~/path/to/eltsai.github.io
rbenv local 3.2.2

gem install bundler
rm Gemfile.lock     # optional but good if switching Ruby versions
bundle install


# -----------------------------------------------------------------------------
# Run the Jekyll server
# -----------------------------------------------------------------------------
bundle exec jekyll serve