FROM debian:11

# Install Headless JRE after updating installed packages.
RUN apt-get update && apt-get install -y unzip default-jdk curl wget
RUN apt-get clean

RUN curl -s https://api.github.com/repos/tabulapdf/tabula/releases/latest \
    | grep "browser_download_url.*jar*" \
    | cut -d '"' -f 4 \
    | wget -qi - && \
    unzip tabula-jar-*.zip -d ~/ && rm tabula-jar-*.zip

COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]