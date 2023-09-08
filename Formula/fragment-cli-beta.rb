require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3505.0.0-darwin-x64.tar.gz"
    sha256 "97887af0ddc48be9c497cf7f56c9bfe863939cf6d4cdbdc3f9750d2fe42a8a88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3505.0.0-darwin-arm64.tar.gz"
      sha256 "4db6daabccfb3bd1b0168411e2b77c59a10b52149069a4b5fbd069beb71e840a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3505.0.0-linux-x64.tar.gz"
    sha256 "0e66c934a538ba41e6330f9e6f141940fbdd923d842d511305ba473e390c24a9"
  end
  version "3505.0.0"
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
