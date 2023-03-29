require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2296.0.0-darwin-x64.tar.gz"
    sha256 "031c2934a2e0c049339e7930dc8274169b23d9751a565b4d21a744237d6abfd6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2296.0.0-darwin-arm64.tar.gz"
      sha256 "bf7d22c5056d672ad5240af5c6b02eef09553cf0fbd9f754a660341eee645000"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2296.0.0-linux-x64.tar.gz"
    sha256 "fa42f8cb253ad98c70529ec85acec2546d97545d8e2dfb8ab4db2b5409625852"
  end
  version "2296.0.0"
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
