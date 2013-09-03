



# Strings ain't factors
options(stringsAsFactors = FALSE)


# Load knitr and markdown to generate the report
library(knitr)
library(markdown)


# Temp quarter label
qtr_label <- "2013 Q2"


# Loop over each county (or collection of counties)
counties <- list(
    data.frame(county = "Denver",
               hd_label = "Denver County",
               hd_tag = "Denver",
               county_label = "Denver County",
               prefix = "denver_"),

    data.frame(county = "Boulder",
               hd_label = "Boulder County",
               hd_tag = "Boulder",
               county_label = "Boulder County",
               prefix = "boulder_"),

    data.frame(county = "Broomfield",
               hd_label = "Broomfield County",
               hd_tag = "Broomfield",
               county_label = "Broomfield County",
               prefix = "broomfield_"),

    data.frame(county = "Jefferson",
               hd_label = "Jefferson County",
               hd_tag = "Jefferson",
               county_label = "Jefferson County",
               prefix = "jefferson_"),

    data.frame(county = "Adams",
               hd_label = "Adams County",
               hd_tag = "Adams",
               county_label = "Adams County",
               prefix = "adams_"),

    data.frame(county = "Arapahoe",
               hd_label = "Arapahoe County",
               hd_tag = "Arapahoe",
               county_label = "Arapahoe County",
               prefix = "arapahoe_"),

    data.frame(county = "Douglas",
               hd_label = "Douglas County",
               hd_tag = "Douglas",
               county_label = "Douglas County",
               prefix = "douglas_"),

    data.frame(county = c("Adams", "Arapahoe", "Douglas"),
               hd_label = "Tri-County Health Department",
               hd_tag = "Tri-County",
               county_label = "Adams, Arapahoe, and Douglas Counties",
               prefix = "tricounty_"),

    data.frame(county = c("Adams", "Arapahoe", "Boulder", "Broomfield",
                          "Denver", "Douglas", "Jefferson"),
               hd_label = "the Denver Metropolitan Area",
               hd_tag = "Denver Metro",
               county_label = "the Denver Metropolitan Area",
               prefix = "metro_")

)


# Loop over the counties
lapply(counties, function(x) {


    mdfile <- file.path("temp", "county_report.md")

    htmlfile <- paste(x$hd_tag[1], 
                      " ",
                      qtr_label, 
                      ".html",
                      sep = "")



    # Knit it
    knit("county_report.rmd", 
         output = mdfile)

    # Convert to HTML
    markdownToHTML(file = mdfile,
                   output = htmlfile,
                   stylesheet = file.path("..", "css", "tb_report.css"))


})
