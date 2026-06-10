# Yocto 6.0 Wrynose + SPDX 3.0 SBOM

| Property        | Value                                                    |
|-----------------|----------------------------------------------------------|
| Yocto release   | 6.0 Wrynose                                              |
| Tag             | yocto-6.0 (oe-core / bitbake / meta-yocto)               |
| Machine         | qemux86-64                                               |
| Image           | core-image-minimal                                       |
| SBOM format     | SPDX 3.0.1** (.rootfs.spdx.json)                         |
| Kernel          | Linux 6.18 LTS                                           |
| Toolchain       | GCC 15.2, glibc 2.43                                     |
| Layer manager   | [kas](https://kas.readthedocs.io/) 5+                    |
| CVE tool        | [sbom-cve-check](https://sbom-cve-check.readthedocs.io/) |

```bash
kas build kas.yml
```

The SBOM is generated during the build:

```
build/tmp/deploy/images/qemux86-64/
└── core-image-minimal-qemux86-64.rootfs.spdx.json
```

## sbom-cve-check

```bash
pip3 install sbom-cve-check

SBOM="build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.spdx.json"

# Per-package CVE report (CSV)
sbom-cve-check \
  --sbom-type spdx3 \
  --sbom-path "$SBOM" \
  --disable-auto-updates \
  --export-type csv \
  --export-path cve-report.csv

# Full Yocto-style JSON manifest (all packages, including clean ones)
sbom-cve-check \
  --sbom-type spdx3 \
  --sbom-path "$SBOM" \
  --disable-auto-updates \
  --export-type yocto-cve-check-manifest \
  --export-path cve-report.json
```

Kernel SBOM
```bash
KSBOM="build/tmp/work/qemux86_64-poky-linux/linux-yocto/*/spdx/3.0.1/deploy/qemux86_64/builds/build-linux-yocto.spdx.json"

# exact kernel commit
jq -r '."@graph"[]|select(.software_downloadLocation//""| test("linux-yocto.git"))|.software_downloadLocation' $KSBOM

# applied patches
jq -r '."@graph"[]|select(.software_additionalPurpose[]?=="patch")|.name' $KSBOM
```

- `SPDX_INCLUDE_VEX: all`: Embeds all `CVE_STATUS` annotations from every
  recipe as VEX statements -> classify CVEs as *not-applicable*, *fixed*,
  *under-investigation*, etc.
- `SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto: 1`:  Records which kernel
  source files were compiled -> filter by compiled files.
- `SPDX_INCLUDE_PACKAGECONFIG: 1` : Captures enabled/disabled `PACKAGECONFIG`
  features per recipe —> improves scoping accuracy for feature-conditional
  CVEs.

## Run under QEMU

```bash
kas shell kas.yml -c "runqemu qemux86-64 nographic"
```
