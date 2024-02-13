require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4552.0.0-darwin-x64.tar.gz"
    sha256 "bc0475e636a1e4c6b1b42acb7f8f8522e67c089d491fb2965c97706c48794e44"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4552.0.0-darwin-arm64.tar.gz"
      sha256 "9c1bdf981720ef253a6b915db9fcac9fa62248f001bd424ff227965d02101733"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4552.0.0-linux-x64.tar.gz"
    sha256 "a218ded759e8dc722c5e988f73433a611918fc82ea94256c7aaec4b723d2010b"
  end
  version "4552.0.0"
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
