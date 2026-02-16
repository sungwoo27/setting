FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash tester && \
    echo "tester ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY --chown=tester:tester . /home/tester/setting

USER tester
WORKDIR /home/tester

RUN git config --global user.email "test@example.com" && \
    git config --global user.name "Test User"

RUN chmod +x /home/tester/setting/*.sh /home/tester/setting/*/install.sh

CMD ["/bin/bash", "-c", "cd /home/tester/setting && ./install.sh && exec zsh"]