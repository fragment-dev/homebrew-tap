require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2518.0.0-darwin-x64.tar.gz"
    sha256 "80e9d74c2e5af177e43b6dc934da1967931f5ddedad41eeb5b481f8dd4231053"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2518.0.0-darwin-arm64.tar.gz"
      sha256 "f3c128ca6431eaa2162132579240c977f632b6ce87040aa1e46ba92f6d20d753"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2518.0.0-linux-x64.tar.gz"
    sha256 "d1dc987250b2c4fdf5952977652b7855918b5fda62f3dd489c1f05f8288fd9a0"
  end
  version "2518.0.0"
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
