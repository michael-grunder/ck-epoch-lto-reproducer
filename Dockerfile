FROM --platform=linux/aarch64 opensuse/tumbleweed

RUN zypper --non-interactive install --type pattern devel_basis && \
    zypper --non-interactive install \
        gdb \
        neovim \
        git

RUN echo "alias vi=nvim" >> /root/.bashrc

RUN git clone --depth 1 --branch 0.7.2 \
    https://github.com/concurrencykit/ck.git /opt/ck

RUN cd /opt/ck && \
    CFLAGS="-O2 -flto" ./configure --prefix=/usr && make -j$(nproc)

RUN cd /opt/ck && \
    make -C regressions/ck_epoch/validate ck_epoch_section_2

# Uncomment if you want to reproduce and build at the same time
# RUN cd /opt/ck && \
# regressions/ck_epoch/validate/ck_epoch_section_2 1 1 1
