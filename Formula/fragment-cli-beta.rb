require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5802.0.0-darwin-x64.tar.gz"
    sha256 "2757a953bc8c62789d5de1cdb24389dfd5e9dfb118f6811d58473f14ef9f0ff0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5802.0.0-darwin-arm64.tar.gz"
      sha256 "67925cd21b2b299675e864e3f1d04d25621084f59ecd5410c5093578dd0a1a77"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5802.0.0-linux-x64.tar.gz"
    sha256 "2afbbd64afdebab0ea61b95efd49463cbf33e98bfa28de5fdfc49f24649b7bf8"
  end
  version "5802.0.0"
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
