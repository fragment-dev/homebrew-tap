require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5243.0.0-darwin-x64.tar.gz"
    sha256 "0108dd5ca9f557a0c551d4582b4938c0da5d243c8fa83609baeab2fa7ee77f12"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5243.0.0-darwin-arm64.tar.gz"
      sha256 "a93d39ca4f405181de5406ceea2a1e21587b949293d4e988f0c713c968b5969b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5243.0.0-linux-x64.tar.gz"
    sha256 "dec3277f0d518734cf307d32c94724e1bef28ea20100304c110eff4ad7a709a9"
  end
  version "5243.0.0"
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
