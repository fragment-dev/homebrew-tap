require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4058.0.0-darwin-x64.tar.gz"
    sha256 "97d4f7894930c3b65e7028389321af3aa44ff2c85267be2e1f78fbc02dd4a138"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4058.0.0-darwin-arm64.tar.gz"
      sha256 "98faad79eeb1b1538927a122ad7392a3003de3165f7c1df0c2f459042eec20d8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4058.0.0-linux-x64.tar.gz"
    sha256 "238c603dea3a921172ad327f1e967dff4c551df25f8b52e3325ae115cc41ad06"
  end
  version "4058.0.0"
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
