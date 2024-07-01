require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5331.0.0-darwin-x64.tar.gz"
    sha256 "62f3298b55f4b1d3871615465b8189ddef6004b3e668ca7c262ff89ce7fec250"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5331.0.0-darwin-arm64.tar.gz"
      sha256 "66d6ce3958e98103b4a19e10bad5793b4f869ff3a686c1664c929958697cd5be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5331.0.0-linux-x64.tar.gz"
    sha256 "66a48f14f7b075875bf64fd74ffaf5749199cfe9523b3ff4bdbaab64127f64c9"
  end
  version "5331.0.0"
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
