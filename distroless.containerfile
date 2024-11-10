from fedora:latest as build-env

run mkdir /output
run dnf -y --installroot /output --releasever $(rpm -E %fedora) --setopt=install_weak_deps=false --nodocs install glibc-minimal-langpack coreutils-single
run dnf -y --installroot /output --releasever $(rpm -E %fedora) clean all

from scratch
copy --from=build-env /output /
