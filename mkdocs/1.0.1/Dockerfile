FROM squidfunk/mkdocs-material:9.5.23


#  install gobject-2.0-0
RUN apk add glib pango

# Install the plugins
RUN pip install mkdocs-minify-plugin
RUN pip install mkdocs-pdf-export-plugin
