require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3927.0.0-darwin-x64.tar.gz"
    sha256 "f4f30821fcd2d56292f46b14c40e3bd2492119e321d1aafe09b0e01927567da0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3927.0.0-darwin-arm64.tar.gz"
      sha256 "a27cd9fcc5f2ac10e7710406604dcddb705ee1a72ac0acc1d90694a4be35830c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3927.0.0-linux-x64.tar.gz"
    sha256 "1ed2654710eab2a1222e0fc37d43e4cac6bfe6475abddb76b577e28ef5727e14"
  end
  version "3927.0.0"
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
