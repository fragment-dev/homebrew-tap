require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3156.0.0-darwin-x64.tar.gz"
    sha256 "c85ac2ab23a951e710e37c337a8e67390bcb8a7a24fd5d3f4a05bc5087ca479a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3156.0.0-darwin-arm64.tar.gz"
      sha256 "7c668177a4788efd085c7133f414ac8cd98784146f6b141e0e53c0f5505b970e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3156.0.0-linux-x64.tar.gz"
    sha256 "f51ecb311c6d876a97211ddfc2386dc7a3b56e195e293ee2c5794021a40bdc15"
  end
  version "3156.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
