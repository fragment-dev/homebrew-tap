require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3057.0.0-darwin-x64.tar.gz"
    sha256 "9e0db051ed9d2d1ec017bd696f0ef90488eda99a58a712eb067a17e815f1ccb4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3057.0.0-darwin-arm64.tar.gz"
      sha256 "8bdbb0f81d09659f93fe90379810b8bdc6810dc48c5e46b0d495bb06dd43e7d6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3057.0.0-linux-x64.tar.gz"
    sha256 "554feac7997d4b1d6bb06095b669b092f7a237c4b3335507bdcdec0954392baa"
  end
  version "3057.0.0"
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
