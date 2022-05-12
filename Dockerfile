FROM bioconductor/bioconductor_docker:latest
RUN apt-get update && \
	apt-get install -y --no-install-recommends apt-utils && \
	apt-get install -y --no-install-recommends \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texi2html \
	texinfo && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
RUN R -e 'BiocManager::install(c("Biobase", "BiocVersion", "BiocStyle", "DESeq2", "edgeR", "monocle", "mixOmics"))' && \
    R -e 'install.packages(c("Seurat", "Signac", "WGCNA", "survival"))'
