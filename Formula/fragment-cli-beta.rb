require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6001.0.0-darwin-x64.tar.gz"
    sha256 "0adfa7af720312f7df871ef9547a8c6772fdedda6c2cfc7108b70f8645a0a578"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6001.0.0-darwin-arm64.tar.gz"
      sha256 "8a41dd9281123011a590ed6f0e00372f44a06a68f7f4f9ff3fa05bd2449aa2f8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6001.0.0-linux-x64.tar.gz"
    sha256 "5fc2210fb1e4d7ad6b57bc4a50a01c13aa803dd39d171c2bfe5ae411e9d0c578"
  end
  version "6001.0.0"
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
