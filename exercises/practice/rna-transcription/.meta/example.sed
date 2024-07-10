v 4.9

/[^GCTAGCTA]/ {
    s/.*/INVALID DNA STRAND/w /dev/stderr
    Q 1
}
y/GCTAGCTA/CGAUCGAU/
