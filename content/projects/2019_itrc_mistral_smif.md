---
title: "ITRC MISTRAL (smif)"
client: "[Environmental Change Institute](https://www.eci.ox.ac.uk/), University of Oxford"
description: "Engineering, modelling & simulation project in infrastructure planning."
date: 2019-01-25T16:38:09+01:00
draft: false
---

## The ITRC MISTRAL project

More info coming soon.

## Smif

The **s**imulation **m**odelling **i**ntegration **f**ramework (smif) [1,2] is a software framework for the integration of simulation models of infrastructure systems such as energy, transport, water and digital communications.
Infrastructure systems provide essential basic services to society but can also have harmful social and environmental impacts.
Plans and decisions are subject to uncertain socio-economic, technological and environmental change.
These complexities are best studied through simulation.

smif enables the coupling and orchestration of an heterogeneous ensemble of models: each model has its own space and time resolution, set of inputs and outputs and data formats.
To run under smif, models must be wrapped by a well-defined Python class, which provides a common interface.
smif's purpose is to provide infrastructure systems modellers a tool capable of handling the execution of the models according to their dependencies, as well as the necessary data exchange between models, transforming data if necessary.

The development of smif is driven by the National Infrastructure Systems Model (NISMOD2), which consists of a collection of high-resolution infrastructure models of the United Kingdom.
However, smif is a very general framework that can applied whenever models can be executed from Python, via import, binding, or call out to a command-line executable.

## RSE involvement with the project

"The OxRSE group has helped us deliver the latter stages of the ambitious MISTRAL programme. They have been highly responsive and available, with technical skills that matched our needs.
With their collaboration, we have been able to implement many of the features we need to facilitate uptake of our model integration framework by stakeholders in academia, government and business."

Tom Russell, Will Usher and Miriam Mendes

## References

1. Will Usher and Tom Russell | **A Software Framework for the Integration of Infrastructure Simulation Models** | [*Journal of Open Research Software*](https://openresearchsoftware.metajnl.com/) | 2019 | ([doi](https://doi.org/10.5334/jors.265))

1. Will Usher, Tom Russell, Roald Schoenmakers, Craig Robson, Fergus Cooper and Thibault Lestang | **nismod/smif v1.2.0** | *Zenodo* | 2019 | ([doi](http://doi.org/10.5281/zenodo.1309336))
