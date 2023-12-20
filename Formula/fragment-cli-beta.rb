require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4179.0.0-darwin-x64.tar.gz"
    sha256 "4c7133db7c4b1471d69a7acf6f23de51b34eea27b8c8e6afda50bd2b09410a31"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4179.0.0-darwin-arm64.tar.gz"
      sha256 "3e1472b02c693ece8b8880b431ddc51cf819e7cd28450751605d0cd02192e735"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4179.0.0-linux-x64.tar.gz"
    sha256 "a5289433aa7e1708d4c6acc8447fd281f30079ff19782d20652446b4394fe240"
  end
  version "4179.0.0"
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
