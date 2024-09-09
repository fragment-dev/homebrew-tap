require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5574.0.0-darwin-x64.tar.gz"
    sha256 "dbada35b76766d3cae559864f3253773219cc2435271dd9f8e094fe6fca5acf1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5574.0.0-darwin-arm64.tar.gz"
      sha256 "c6ef1e303cfa5a3c05e88fbc5ad6d78e78e366d42e30fb0c67c215c540e7d7be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5574.0.0-linux-x64.tar.gz"
    sha256 "6fe9dd023805560177301813ba6c7cb44fe0f43d02322f3fd01b9f92a52bc626"
  end
  version "5574.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
