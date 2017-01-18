# Course Updater
This repo contains a handy Ruby script and CSV source for cloning or updating git repositories into your current directory. The clone removes the `.git/` directory from each cloned repo in order to avoid submodules. It is currently used for GDI Chicago courses.

### How To
To use, run the `update.rb` script from the directory in which you would like to contain the source repositories. For example, my current directory is `src/project`. I have a couple of the courses listed in my `courses.csv` file, but I have added some and need to update the others. Let's say `update.rb` lives in `src/course-updater`. To run my script, I'll do the following from the command line:

```
ruby ../course-updater/update.rb
```

To add to the list of repos to be pulled down, add the HTTPS or SSH url for the desired repo to the `courses.csv` file. The next time you run the script, this repo will be available!

### Dependencies
ruby 2.3.1

#### TODO:
* Accept command line arguments to add/remove repos to source file
