# depmap 1.19

## Changes in version 1.19.1

- Added 24Q2 data to `dmsets` and `dmfiles` to enable latest data to be analyzed

## Changes in version 1.19.0

- New devel version.

# depmap 1.17

## Changes in version 1.17.5

- Check if there's internet connectivity before creating hub
  accessors.

## Changes in version 1.17.4

- Fix .onLoad() to create Hub accessors for all experiments, including
  older versions.

## Changes in version 1.17.3

- Bump version to publish latest vignette updates.

## Changes in version 1.17.2

- Add new section on `dmsets()` and `dmfiles()`. <2024-02-26 Mon>

## Changes in version 1.17.1

- New depmap datasets and files infrastructure to directly download
  individual files. See `?DepMapFiles` for details. <2024-02-25 Sun>

## Changes in version 1.17.0

- New devel version.

# depmap 1.11

## Changes in version 1.11.2

- 22Q2 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`,
  `metadata` and `achilles` datasets. Note: 22Q2 is the last release to follow
  a quarterly release schedule. Future Depmap releases will follow a bi-annual
  release schedule with dataset updates every 6 months.

## Changes in version 1.11.1

- EH numbers have been updated in the latest dataset (see #78)

# depmap 1.9

## Changes in version 1.9.2

- 22Q1 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. New datasets were added, including `gene_summaries`
  and `achilles` describing Depmap Achilles screens and gene essentiality
  probabilities, respectively. New loading functions were created for these
  datasets. Newer versions for the other datasets were not released.

## Changes in version 1.9.1

- 21Q4 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. Newer versions for the other datasets were
  not released.

## Changes in version 1.9.0

- New devel version for Bioc 3.15

## Changes in version 1.7.1

- 21Q3 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. Newer versions for the other datasets were
  not released.
- CERES CRISPR data has been deprecated and has been replaced with Chronos
  CRISPR dependency in 21Q3 and all future releases. For more information, see:
  https://cancerdatascience.org/blog/posts/ceres-chronos/

## Changes in version 1.7.0

- New Bioc devel release.

# depmap 1.5

## Changes in version 1.5.3

- 21Q2 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. Newer versions for the other datasets were
  not released.
- Additional compound metadata was added to drug_dependency_19Q3
- ensembl_id to entrez_id in TPM data was corrected for datasets stored on EH

## Changes in version 1.5.2

- 21Q1 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. Newer versions for the other datasets were
  not released.
- Loading function bug was fixed.
- Fix ensembl_id to entrez_id in TPM data (see #64)

## Changes in version 1.5.1

- 20Q4 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. Newer versions for the other datasets
  were not released.

## Changes in version 1.5.0

- New Bioc devel verison

# depmap 1.3

## Changes in version 1.3.2

- 20Q3 data added for `crispr`, `copyNumber`, `TPM`, `mutationCalls`
  and `metadata` datasets. Newer versions for the other datasets
  were not released.

## Changes in version 1.3.1

- 20Q2 data added
- Included new `proteomic` dataset
- `expression` variable in `TPM` dataset changed to `rna_expression`

# depmap 1.1

## Changes in version 1.1.3

- The using_depmap vignette has been updated to illustrate how to
  visualize depmap data using ggplot2.

## Changes in version 1.1.2

- 20Q1 data added

## Changes in version 1.1.1

- 19Q4 data added
- Updated loading functions (accessor functions)
- 19Q4 versions of `rnai`, `RPPA` and `drug_sensitivity` were not
  released for this quarter, and therefore the 19Q3 releases for
  these datasets are the most current versions.

# depmap 0.99

## Changes in version 0.99.5

- 19Q3 data added
- Included new `drug_sensitivity` dataset

## Changes in version 0.99.4

- 19Q2 data added
- Package submitted to Bioconductor
- New data loading functions (accessor functions)

## Changes in version 0.99.0

- 19Q1 data added
- Preparing for Bioconductor submission
