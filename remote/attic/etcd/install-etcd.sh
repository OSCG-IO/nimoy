ETCD_VER=v3.3.15

# choose either URL
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GITHUB_URL}

rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1 2>/dev/null
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

pkill -f etcd
sudo cp /tmp/etcd-download-test/etcd* /usr/local/bin

etcd --version
etcdctl version
