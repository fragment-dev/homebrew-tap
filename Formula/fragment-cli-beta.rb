require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4401.0.0-darwin-x64.tar.gz"
    sha256 "4246fcee33221348bf44550ae56a079876c06b83d70e067dc1ee473369f23217"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4401.0.0-darwin-arm64.tar.gz"
      sha256 "fa44f9dd861de008db87eb333e57afc4813d8d0dbf1e392e32aefdcb0b0848ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4401.0.0-linux-x64.tar.gz"
    sha256 "f2ec82c7f651c49fb27db060f2ef1da1340ebe3888a6e2ef7ec657c3bec39b06"
  end
  version "4401.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
