require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4712.0.0-darwin-x64.tar.gz"
    sha256 "55e2f0b683867f446daf5c84735e15eea83302bb67a1e71eafecfd53ed4aecd0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4712.0.0-darwin-arm64.tar.gz"
      sha256 "531ebeb28fd7001967849168668f38126a1d6d81f0cfb11ef448b16f0c0c607c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4712.0.0-linux-x64.tar.gz"
    sha256 "cfd4276a682e23ee7c20d4c69a1bff4ebc1bae615aa05961d85d1a1894901bc9"
  end
  version "4712.0.0"
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
