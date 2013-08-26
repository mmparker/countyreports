



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
               county_label = "Denver County"),
               
    data.frame(county = "Boulder",
               hd_label = "Boulder County",
               county_label = "Boulder County"),
               
    data.frame(county = "Broomfield",
               hd_label = "Broomfield County",
               county_label = "Broomfield County"),
               
    data.frame(county = "Jefferson",
               hd_label = "Jefferson County",
               county_label = "Jefferson County"),
               
    data.frame(county = "Adams",
               hd_label = "Adams County",
               county_label = "Adams County"),
               
    data.frame(county = "Arapahoe",
               hd_label = "Arapahoe County",
               county_label = "Arapahoe County"),
               
    data.frame(county = "Douglas",
               hd_label = "Douglas County",
               county_label = "Douglas County"),
               
    data.frame(county = c("Adams", "Arapahoe", "Douglas"),
               hd_label = "Tri-County Health Department",
               county_label = "Adams, Arapahoe, and Douglas Counties"),

    data.frame(county = c("Adams", "Arapahoe", "Boulder", "Broomfield",
                          "Denver", "Douglas", "Jefferson"),
               hd_label = "the Denver Metropolitan Area",
               county_label = "the Denver Metropolitan Area")


               
               
)


# Loop over the counties
lapply(counties, function(x) {


    mdfile <- file.path("temp", "county_report.md")

    htmlfile <- file.path("reports", 
                          paste(x$hd_label[1], 
                                " ",
                                qtr_label, 
                                ".html",
                                sep = "")
    )



    # Knit it
    knit("county_report.rmd", 
         output = mdfile)

    # Convert to HTML
    markdownToHTML(file = mdfile,
                   output = htmlfile,
                   stylesheet = file.path("..", "css", "tb_report.css"))


})
