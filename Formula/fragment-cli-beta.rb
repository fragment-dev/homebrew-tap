require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2386.0.0-darwin-x64.tar.gz"
    sha256 "71bbda1f4b0c11a9d919437ab867a928f7fffdbbb7ce2857109c0917b4642108"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2386.0.0-darwin-arm64.tar.gz"
      sha256 "b803fe08e6219bf037060369bd208a270de4de2d67b2af606574f15b0abb2bdc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2386.0.0-linux-x64.tar.gz"
    sha256 "32252de7eaadf6e484e3263a5bf6a2ce8fa8d82e4b1869d1d37e786c7393f646"
  end
  version "2386.0.0"
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
