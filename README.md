[![Update Pages](https://github.com/jbrestan/structurizr-mkdocs-pages/actions/workflows/update-pages.yml/badge.svg)](https://github.com/jbrestan/structurizr-mkdocs-pages/actions/workflows/update-pages.yml)

Sample repository showing how to develop version controlled [Structurizr](structurizr.com) [C4 model](c4model.com) of your architecture locally with resulting diagrams hosted using [MkDocs](mkdocs.org) static page generator. This is little more than a bit of glue code to contain everything in a single repo (could be part of your app repo if you want everything together) sprinkled with GitHub automation to host the result as GH Pages, but I hope this can be used to save you a bit of time if you're trying to solve the same problem and, like me a just few days ago, are not familiar with any of the tooling.

You can see the generated documentation here: https://jbrestan.github.io/structurizr-mkdocs-pages/

## Why
Tl;dr version: if your organization needs, size and complexity allows it, I recommend giving [Structurizr cloud or self-hosted server](https://structurizr.com/pricing) a go. But if for any reason you can't or don't want to use cloud Structurizr and are looking for local or statically hosted option, read on!

Using Structurizr to describe your app or the whole product landscape in a single place you can generate diagrams from can be a gamechanger if you want to keep your architecure documentation up to date across multiple apps or perspectives. There's a good explanation of the [difference between diagramming and modelling](https://c4model.com/#Modelling) on the C4 pages and Structurizr is a great implementation of this approach. However if you don't want to use the cloud or self-hosted Structurizr options and just need the diagrams to show in your documentation while still benefiting from the centralized model, it's usually up to you to figure out the exact tooling and process. This repo is an example of such process, using MkDocs as the static docs generator and GitHub pages as the hosting.

## How does it work
[MkDocs](mkdocs.org) is a widely used solution to generate static pages from a bit of configuration and a hierarchy of markdown documents. It's a python tool that you can [install locally to get started](https://www.mkdocs.org/getting-started/) and add plugins to extend the behavior. The two important plugins for us are [macros](https://github.com/fralau/mkdocs_macros_plugin) and [mermaid2](https://github.com/fralau/mkdocs-mermaid2-plugin) which allow us to include contents of another file in our docs markdown document and render mermaid syntax as a diagram on the resulting page.

We can get the diagrams in mermaid syntax using [Structurizr CLI](https://github.com/structurizr/cli) which offers [exporting the model into various other formats](https://github.com/structurizr/cli/blob/master/docs/export.md#examples).

The rest is just glue to make this work together. As you make changes to the model file, you can either view them locally using [Structurizr Lite](https://structurizr.com/help/lite) by starting `run-structurizr.sh` on your machine and navigating to `localhost:8080`. To view the full result export the mermaid files using `export-structurizr-diagrams.sh` script, include them in the documentation with a macro like `{% include 'diagrams/structurizr-Diagram1.mmd' %}`, build the docs and serve on localhost with `mkdocs serve` and navigate to `localhost:8000` to see the result.

Once you push the changes, [GH action](https://github.com/jbrestan/structurizr-mkdocs-pages/blob/main/.github/workflows/update-pages.yml) will handle the diagram export and GitHub pages update.
