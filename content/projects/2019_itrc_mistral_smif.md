---
title: "ITRC MISTRAL"
client: "[Environmental Change Institute](https://www.eci.ox.ac.uk/), University of Oxford"
description: "Engineering, modelling & simulation project in infrastructure planning."
image: "projects/rse_logo_placeholder.svg"
imagealt: "OxRSE logo"
date: 2019-01-25T16:38:09+01:00
draft: false
---

## The ITRC MISTRAL project

[ITRC](https://www.itrc.org.uk/) is a partnership between seven UK universities with an aim of helping business and policymakers in the UK and around the world understand the risks and long term benefits of investments in infrastructure.
They are currently analysing scenarios and options for the [Cambridge-Milton Keynes-Oxford Corridor](https://www.itrc.org.uk/consultation-dissemination-event-november-2019/).

## Oxford RSE involvement

This type of analysis is supported by a variety of bespoke software, including [NISMOD](https://github.com/nismod/nismod2/issues), the **n**ational **i**nfrastructure **s**ystems **mod**el, and [smif](https://github.com/nismod/smif), the **s**imulation **m**odelling **i**ntegration **f**ramework.
Smif is a python package designed to enable the integration of models such as infrastructure models for water, energy, transport and digital communications in the UK, and this integrated set of infrastructure models is NISMOD.

The Oxford RSE group became involved in February 2019 when we stepped in at short notice to help expand the capabilities of smif, and help integrate infrastructure models into NISMOD.

> "The OxRSE group has helped us deliver the latter stages of the ambitious MISTRAL programme. They have been highly responsive and available, with technical skills that matched our needs.
> With their collaboration, we have been able to implement many of the features we need to facilitate uptake of our model integration framework by stakeholders in academia, government and business."
>
> --- Tom Russell, Will Usher and Miriam Mendes

## More details

Smif [1,2] is a software framework for the integration of simulation models of infrastructure systems such as energy, transport, water and digital communications.
Infrastructure systems provide essential basic services to society but can also have harmful social and environmental impacts.
Plans and decisions are subject to uncertain socio-economic, technological and environmental change.
These complexities are best studied through simulation.

Smif enables the coupling and orchestration of an heterogeneous ensemble of models: each model has its own space and time resolution, set of inputs and outputs and data formats.
To run under smif, models must be wrapped by a well-defined Python class, which provides a common interface.
Smif's purpose is to provide infrastructure systems modellers a tool capable of handling the execution of the models according to their dependencies, as well as the necessary data exchange between models, transforming data if necessary.

The development of smif is driven by the National Infrastructure Systems Model (NISMOD2), which consists of a collection of high-resolution infrastructure models of the United Kingdom.
However, smif is a very general framework that can applied whenever models can be executed from Python, via import, binding, or call out to a command-line executable.

### References

1. Will Usher and Tom Russell | **A Software Framework for the Integration of Infrastructure Simulation Models** | [*Journal of Open Research Software*](https://openresearchsoftware.metajnl.com/) | 2019 | ([doi](https://doi.org/10.5334/jors.265))

1. Will Usher, Tom Russell, Roald Schoenmakers, Craig Robson, Fergus Cooper and Thibault Lestang | **nismod/smif v1.2.0** | *Zenodo* | 2019 | ([doi](http://doi.org/10.5281/zenodo.1309336))
