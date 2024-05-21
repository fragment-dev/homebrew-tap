require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5097.0.0-darwin-x64.tar.gz"
    sha256 "9200d61725a6650231c1fe37ca211a4980a9482c8828f399b9569ecbe2fb33d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5097.0.0-darwin-arm64.tar.gz"
      sha256 "8fba34ba95100d92c0e4961160c2dda71d2ceda8b8eec9250c971675d15343a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5097.0.0-linux-x64.tar.gz"
    sha256 "0a03ca629aa550a1b78d58a651066388bce0a0d4bb030bc1919c9b8970620acc"
  end
  version "5097.0.0"
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
