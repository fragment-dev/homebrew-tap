require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4129.0.0-darwin-x64.tar.gz"
    sha256 "23cbeab943b41785fa3070c5470e29cecb7970c410827bf7048b767eabb025c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4129.0.0-darwin-arm64.tar.gz"
      sha256 "8d6beebc13c8c238b6b353ce55cb867896ccad2699359e74c23b5011356fbe60"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4129.0.0-linux-x64.tar.gz"
    sha256 "601ff8d1f2765e4345e7e7b4379003b0abe3b341762fab9ef5671e7f37c28805"
  end
  version "4129.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
