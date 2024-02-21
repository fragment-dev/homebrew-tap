require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4605.0.0-darwin-x64.tar.gz"
    sha256 "9b56117b7b2e01403790f254abed41820af87c5a14d4b41aadb70ce864ef1c74"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4605.0.0-darwin-arm64.tar.gz"
      sha256 "2ecdba4f0e110b245cdfcf50e8585efb741d1fb1f1ac63a8e15af9c8bcc141fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4605.0.0-linux-x64.tar.gz"
    sha256 "926546ae548ba64126e8998449e908aaa956cf8240ff9671bce1252dfed11655"
  end
  version "4605.0.0"
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
