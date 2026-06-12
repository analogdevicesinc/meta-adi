SUMMARY = "Linux kernel built after merge to latest stable upstream (see merge_latest_stable)"
DESCRIPTION = "Builds the feature branch after merging with upstream latest stable as per merge_latest_stable script."
LICENSE = "GPL-2.0-only"

PROVIDES = "virtual/kernel"

KERNEL_IMAGETYPE = "zImage"

SRC_URI = ""

S = "${WORKDIR}/linux-kernel-stable-patched"

inherit kernel

do_fetch() {
    upstream_url="https://github.com/gregkh/linux"
    origin_url="https://github.com/analogdevicesinc/linux.git"
    feature_branch="adsp-6.18.31-y"

    head_sha_=`git ls-remote "$origin_url" "refs/heads/${feature_branch}" | awk '{print $1}'`
    if [ "x$head_sha_" = "x" ]; then echo "ERROR: Could not resolve ${feature_branch} on ${origin_url}"; exit 1; fi
    echo "merge_latest_stable on $head_sha_"

    rm -rf ${WORKDIR}/linux-kernel-stable-patched
    git init ${WORKDIR}/linux-kernel-stable-patched
    cd ${WORKDIR}/linux-kernel-stable-patched

    raw_makefile=`curl -fsSL "https://raw.githubusercontent.com/analogdevicesinc/linux/${head_sha_}/Makefile"`
    version=`echo "$raw_makefile" | awk '/^VERSION[[:space:]]*=/ {print $3; exit}'`
    patchlevel=`echo "$raw_makefile" | awk '/^PATCHLEVEL[[:space:]]*=/ {print $3; exit}'`
    sublevel=`echo "$raw_makefile" | awk '/^SUBLEVEL[[:space:]]*=/ {print $3; exit}'`
    lts_base="v${version}.${patchlevel}"

    echo "got version $version.$patchlevel.$sublevel"

    bare_prefix=`echo $lts_base | sed 's/^v//'`
    lts_stable=`curl -fsSL https://www.kernel.org/releases.json | jq -r --arg p "$bare_prefix" '
        .releases[] | select((.moniker == "stable" or .moniker == "longterm") and (.version == $p or (.version | startswith($p + ".")))) | "v" + .version
    ' | head -1`
    if [ "x$lts_stable" = "x" ]; then echo "ERROR: No stable/longterm release found for ${lts_base} on kernel.org."; exit 1; fi
    if [ "$sublevel" != "0" ]; then lts_base="$lts_base.$sublevel"; fi

    lts_base_sha=`git ls-remote "$upstream_url" "refs/tags/${lts_base}^{}" | awk '{print $1}'`
    lts_stable_sha=`git ls-remote "$upstream_url" "refs/tags/${lts_stable}^{}" | awk '{print $1}'`

    git fetch --filter=tree:0 "$origin_url" ${head_sha_}
    git fetch --filter=tree:0 "$upstream_url" ${lts_stable_sha}

    depth_feature=`expr \`git rev-list ${lts_base_sha}..${head_sha_} | wc -l\` + 1`
    depth_stable=`expr \`git rev-list ${lts_base_sha}..${lts_stable_sha} | wc -l\` + 1`

    echo "depth feature: $depth_feature"
    echo "depth stable: $depth_stable"

    git fetch "$origin_url" --depth=$depth_feature ${head_sha_}
    git fetch "$upstream_url" --depth=$depth_stable ${lts_stable_sha}

    git checkout ${head_sha_}
    git merge --no-ff --no-edit "$lts_stable_sha" || { echo "ERROR: Merge $lts_stable_sha into $head_sha_ failed."; exit 1; }
}

FILES:${PN}         = "/boot"
FILES:${PN}-modules = "/lib/modules"
PACKAGES += "${PN}-modules"
