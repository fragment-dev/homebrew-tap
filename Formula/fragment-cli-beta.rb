require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5517.0.0-darwin-x64.tar.gz"
    sha256 "fdf670a413011c28dc9066cc6c59628ff289f8cc019a908d54ccf87058e56dab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5517.0.0-darwin-arm64.tar.gz"
      sha256 "3bf578d3e692c019e7258891f452971dae9d74d1925d447569e441123ed5eadd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5517.0.0-linux-x64.tar.gz"
    sha256 "572ff52595cfe51182f3147733bdae58d19f4ae94c445984fbc527a5c067b271"
  end
  version "5517.0.0"
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
