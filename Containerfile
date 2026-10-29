FROM opensuse/leap:16.0

ENV version=v2
ARG bashrc=https://raw.githubusercontent.com/analogdevicesinc/doctools/refs/heads/ci/bashrc
ARG entrypoint_sh=https://raw.githubusercontent.com/analogdevicesinc/doctools/refs/heads/ci/entrypoint.sh
ARG git_defaults_sh=https://raw.githubusercontent.com/analogdevicesinc/doctools/refs/heads/ci/git-defaults.sh
ARG gh_actions_runner_sh=https://raw.githubusercontent.com/analogdevicesinc/doctools/refs/heads/ci/gh-actions-runner.sh

RUN zypper update -y
RUN zypper install -y --no-recommends \
    ca-certificates coreutils curl gzip jq libicu tar unzip

RUN useradd -m runner
WORKDIR /home/runner

ADD ${gh_actions_runner_sh} .
RUN bash ./gh-actions-runner.sh ; rm ./gh-actions-runner.sh

# Install packages required by Yocto Wrynose:
# https://docs.yoctoproject.org/wrynose/ref-manual/system-requirements.html#opensuse-leap-packages
RUN zypper install -y --no-recommends \
    bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo \
    patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect \
    python3-pip python3-websockets python3-xml rpcgen socat tar wget which xz zstd \
    cpio diffutils file findutils gawk glibc-i18ndata

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN mkdir -p /usr/local/bin
WORKDIR /usr/local/bin
ADD ${entrypoint_sh} .
RUN chmod +rx ./entrypoint.sh

ADD ${git_defaults_sh} .
RUN bash ./git-defaults.sh && rm ./git-defaults.sh

USER runner
WORKDIR /home/runner
RUN curl -o .bashrc -L ${bashrc} ; \
    chmod +x .bashrc

ENTRYPOINT ["/bin/bash"]

