require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6126.0.0-darwin-x64.tar.gz"
    sha256 "2af0e8349b89011e8f8316f7ebe8cf315395a2685edb5e18db51abccdf219a18"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6126.0.0-darwin-arm64.tar.gz"
      sha256 "a2dea75351e0e65f6c00e0c9df28155f67016fc309e179ce041871db1ee71070"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6126.0.0-linux-x64.tar.gz"
    sha256 "c8ae37f28bc6afcf68b79b783b1e4bad9e41765df65bbb381f5bccfc9f530685"
  end
  version "6126.0.0"
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
