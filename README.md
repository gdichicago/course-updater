# Course Updater
This repo contains a handy script and CSV source for cloning or updating repositories. It is currently used for GDI Chicago courses.

### Use
To use, run the `update.rb` script from the directory in which you would like to contain the source repositories. For example, my current directory is `src/project`. I have a couple of the courses listed in my `courses.csv` file, but I have added some and need to update the others. Let's say `update.rb` lives in `src/course-updater`. To run my script, I'll do the following from the command line:

```
ruby ../course-updater/update.rb
```

That's it!

### Dependencies
ruby 2.3.1
