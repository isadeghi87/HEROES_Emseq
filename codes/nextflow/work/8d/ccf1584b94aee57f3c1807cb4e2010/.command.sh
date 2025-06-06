#!/bin/bash -euo pipefail
unset DISPLAY
mkdir -p tmp
export _JAVA_OPTIONS=-Djava.io.tmpdir=./tmp
qualimap \
    --java-mem-size=29491M \
    bamqc \
    -gd HUMAN \
    -bam H021-E7U1N6_plasma-03-01.sorted.bam \
     \
    -p non-strand-specific \
    --collect-overlap-pairs \
    -outdir H021-E7U1N6_plasma-03-01 \
    -nt 6

cat <<-END_VERSIONS > versions.yml
"NFCORE_METHYLSEQ:METHYLSEQ:QUALIMAP_BAMQC":
    qualimap: $(echo $(qualimap 2>&1) | sed 's/^.*QualiMap v.//; s/Built.*$//')
END_VERSIONS
