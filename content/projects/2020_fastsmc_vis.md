---
title: "Visualize genetic relatedness in the UK"
client: "[Palamara Lab](https://www.palamaralab.org/), University of Oxford"
description: "[Web application](https://ukancestrymap.github.io/) visualising 
Identical-By-Descent data from the past 1,500 years in the UK"
date: 2019-01-25T16:38:09+01:00
draft: false
---

Detection of Identical-By-Descent (IBD) segments provides a fundamental measure of the 
degree of relatedness between two individual genomes. The [Palamara 
Lab](https://www.palamaralab.org/) in the Department of Statistics, Oxford University, 
has developed a new method, called FastSMC, that enables accurate biobank-scale 
detection of IBD segments transmitted by common ancestors living up to several hundreds 
of generations in the past.

The OxRSE group has been working with the Palamara Lab since July 2019 on their
C++ implementation of FastSMC. This has included improvements to functionality,
stability and use of best practices, as well as creating Python bindings to improve ease
of use for non-specialist users.

In addition, the OxRSE group has developed an interactive [web 
application](https://ukancestrymap.github.io/), to visualise IBD data calculated from 
samples from the UK Biobank data set, which contains the genomes of about 500,000 
donors.

{{< figure
src="/images/fastsmc.png"
link="https://ukancestrymap.github.io/"
width="50%"
alt="Visualising IBD data in the UK"
>}}

This visualisation was created as a companion to the paper:

Juba Nait Saada, Georgios Kalantzis, Derek Shyr, Martin Robinson, Alexander Gusev, Pier 
Francesco Palamara, *Identity-by-descent detection across 487,409 British samples 
reveals fine-scale population structure, evolutionary history, and trait associations*,
bioRxiv, https://doi.org/10.1101/2020.04.20.029819
