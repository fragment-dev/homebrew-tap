require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3597.0.0-darwin-x64.tar.gz"
    sha256 "e3e5e8b7d5d72c69fc192162ed22c816060c161dd69c16cb5b7bea7a80bd0aba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3597.0.0-darwin-arm64.tar.gz"
      sha256 "9bf26c6afb65978ffcd3e72ef90eca1b0d21c020b76f745dff9bfface5205030"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3597.0.0-linux-x64.tar.gz"
    sha256 "5601d3c4ac12b55ce5d1fc9df16c649be1bb8e36e5798ee9ae98296ad9f78a45"
  end
  version "3597.0.0"
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
