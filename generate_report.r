



# Strings ain't factors
options(stringsAsFactors = FALSE)


# Load knitr and markdown to generate the report
library(knitr)
library(markdown)

# Knit it
knit("county_report.rmd")

markdownToHTML(file = "county_report.md",
               output = "county_report.html",
               stylesheet = file.path("..", "..", "css", "tb_report.css"))



