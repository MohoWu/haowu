# this on-liner code tells blogdown to render .Rmd files in static/ folder to 
# whatever output format specified in the YAML and put it under public/ for publishing.
# Hugo will not post-process them (i.e. applying templates to the files).
blogdown::build_dir("static")