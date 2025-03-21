datapubliclu: R Package for Accessing data.public.lu Datasets
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
<!-- badges: end -->

The `datapubliclu` R package provides a convenient interface for
accessing datasets from [data.public.lu](https://data.public.lu), the
open data portal of Luxembourg. It simplifies the process of downloading
and importing data directly into your R environment.

# Installation

You can install the development version of `datapubliclu` from GitHub
using `remotes`.

``` r
# install.packages("remotes")
remotes::install_github("cavrilionis/datapubliclu")
```

# Usage

The package provides functions to list available datasets, download
specific datasets, and import them into R.

## Listing Datasets

Use the `list_datasets()` function to retrieve a list of available
datasets.

``` r
library(datapubliclu)

datasets <- list_datasets()
print(datasets)
```

## Downloading and Importing a Dataset

To download and import a specific dataset, use the `get_dataset()`
function, providing the dataset ID.

``` r
# Example: Downloading the "Population par commune" dataset
population_data <- get_dataset("population-par-commune")
head(population_data)
```

## Searching for Datasets

Use the search_datasets() function to search for datasets based on
keywords.

``` r
# Example: Searching for datasets related to "housing"
housing_datasets <- search_datasets("housing")
print(housing_datasets)
```

## Retrieving Dataset Metadata

Use the `get_dataset_metadata()` function to retrieve metadata for a
specific dataset.

``` r
# Example: Retrieving metadata for the
# "Prix de vente des appartements par commune" dataset
metadata <- get_dataset_metadata("prix-de-vente-des-appartements-par-commune")
print(metadata)
```

## Working with Specific File Formats

`get_dataset()` automatically detects and handles common file formats
(e.g., CSV, XLSX, JSON). You can also specify the file format
explicitly.

``` r
# Example: Importing a CSV file
csv_data <- get_dataset("some-dataset-id", format = "csv")

# Example: Importing an Excel file
excel_data <- get_dataset("another-dataset-id", format = "xlsx")
```

# Example: Analyzing Population Data

``` r
library(datapubliclu)
library(dplyr)
library(ggplot2)

population_data <- get_dataset("population-par-commune")

population_summary <- population_data |>
  group_by(Commune) |>
  summarise(Total_Population = sum(Population)) |>
  arrange(desc(Total_Population))

print(head(population_summary))

ggplot(head(population_summary, 10),
       aes(x = reorder(Commune, Total_Population), y = Total_Population)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Communes by Population",
       x = "Commune",
       y = "Total Population")
```

# Contributing

Contributions are welcome! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them.
4.  Push your changes to your fork.
5.  Submit a pull request.

Please ensure that your code follows the package’s style guidelines and
includes appropriate tests.

# Code of Conduct

Please note that the `datapubliclu` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

# License

This package is licensed under the MIT License.

# Issues and Support

If you encounter any issues or have questions, please [open an
issue](https://github.com/cavrilionis/datapubliclu/issues).
