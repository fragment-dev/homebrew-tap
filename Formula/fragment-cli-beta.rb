require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5416.0.0-darwin-x64.tar.gz"
    sha256 "528797cd3412f02eea16a517f10a6ec702ba936a9a55bd9e294e0ddd9b7f1600"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5416.0.0-darwin-arm64.tar.gz"
      sha256 "bfe10d91ffb71a18da50064d365fd11e68fdd65d32ae5ebcf42ba7f52f2388fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5416.0.0-linux-x64.tar.gz"
    sha256 "86bfef5ea05bed255c001afc675787b0608ebf9307c99d697202743bcf17f56c"
  end
  version "5416.0.0"
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
