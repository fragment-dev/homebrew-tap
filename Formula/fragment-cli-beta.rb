require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2855.0.0-darwin-x64.tar.gz"
    sha256 "8e9cfb1d72dd711e68598b352a630befb16f5ef2dba859f34fdd583f39a35911"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2855.0.0-darwin-arm64.tar.gz"
      sha256 "ed9a8ab53ed7cbba0689af0fc837e3908850c8c585e4e3727a8348e0e99d8bc1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2855.0.0-linux-x64.tar.gz"
    sha256 "f7decb35ff70851b5e4eee6dc29412f95788061d524e72d0982ad14d3fb2e7be"
  end
  version "2855.0.0"
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
