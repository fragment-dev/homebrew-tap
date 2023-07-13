require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3056.0.0-darwin-x64.tar.gz"
    sha256 "942c9aee488b5052137481f249ef7cc8ada9e9a28a65c4da084a20fe461661f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3056.0.0-darwin-arm64.tar.gz"
      sha256 "ec76242db9190f257d2ca15692f09937bb51de6de3b9f561e16ca58147c62c30"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3056.0.0-linux-x64.tar.gz"
    sha256 "f7a609330a463900c39d2c8fc25e2ba7ef63abe2f2c4052387a504cacbf153d8"
  end
  version "3056.0.0"
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
