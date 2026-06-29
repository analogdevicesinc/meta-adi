FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

ADI_KERNEL_URI = "git://github.com/analogdevicesinc/linux.git;protocol=https"
ADI_KERNEL_BRANCH = "adsp-6.18.31-y"
UPSTREAM_STABLE_URI = "https://github.com/gregkh/linux"

SRC_URI = "${ADI_KERNEL_URI};name=machine;branch=${ADI_KERNEL_BRANCH} \
           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https \
           file://sbom-debug-info.cfg"

FETCHCMD_git = "GIT_SSL_NO_VERIFY=1 git -c core.fsyncobjectfiles=0"
KBRANCH = "${ADI_KERNEL_BRANCH}"
KERNEL_VERSION_SANITY_SKIP = "1"
SRCREV_machine = "e6d39c478446f27cb752eccb14ce0075efee68e3"
SRCREV_machine:qemux86-64 = "e6d39c478446f27cb752eccb14ce0075efee68e3"

do_merge_stable() {
    export GIT_SSL_NO_VERIFY=1
    cd ${S}

    head_sha_=`git rev-parse HEAD`
    upstream_url="${UPSTREAM_STABLE_URI}"

    version=`awk '/^VERSION[[:space:]]*=/ {print $3; exit}' Makefile`
    patchlevel=`awk '/^PATCHLEVEL[[:space:]]*=/ {print $3; exit}' Makefile`
    sublevel=`awk '/^SUBLEVEL[[:space:]]*=/ {print $3; exit}' Makefile`
    lts_base="v${version}.${patchlevel}"

    echo "got version $version.$patchlevel.$sublevel"

    bare_prefix=`echo $lts_base | sed 's/^v//'`
    releases_json=`wget -qO- https://www.kernel.org/releases.json`
    lts_stable=`echo "$releases_json" | python3 -c "
import sys, json
data = json.load(sys.stdin)
p = '$bare_prefix'
for r in data['releases']:
    if r['moniker'] in ('stable', 'longterm'):
        v = r['version']
        if v == p or v.startswith(p + '.'):
            print('v' + v)
            break
"`
    if [ "x$lts_stable" = "x" ]; then echo "ERROR: No stable/longterm release found for ${lts_base} on kernel.org."; exit 1; fi
    if [ "$sublevel" != "0" ]; then lts_base="$lts_base.$sublevel"; fi

    lts_base_sha=`git ls-remote "$upstream_url" "refs/tags/${lts_base}^{}" | awk '{print $1}'`
    lts_stable_sha=`git ls-remote "$upstream_url" "refs/tags/${lts_stable}^{}" | awk '{print $1}'`

    treeless=`mktemp -d`
    cd "$treeless"
    git init
    git fetch --filter=tree:0 "$upstream_url" ${lts_stable_sha}
    git fetch --filter=tree:0 "${S}/.git" ${head_sha_}
    depth_feature=`expr \`git rev-list ${lts_base_sha}..${head_sha_} | wc -l\` + 1`
    depth_stable=`expr \`git rev-list ${lts_base_sha}..${lts_stable_sha} | wc -l\` + 1`
    cd "${S}"
    rm -rf "$treeless"

    echo "depth feature: $depth_feature"
    echo "depth stable: $depth_stable"

    git fetch "$upstream_url" --depth=$depth_stable ${lts_stable_sha}
    git merge --no-ff --no-edit "$lts_stable_sha" || { echo "ERROR: Merge $lts_stable_sha into $head_sha_ failed."; exit 1; }
}
do_merge_stable[network] = "1"
addtask merge_stable after do_validate_branches before do_kernel_metadata
