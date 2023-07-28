require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3181.0.0-darwin-x64.tar.gz"
    sha256 "244eb34459ffe5da6cd4c0f9d85906dae358e781fe0638de3ddc94f11057feb2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3181.0.0-darwin-arm64.tar.gz"
      sha256 "bf879bc9f200322259da112535a717cc73cf51920ba40a0cd6e60d13670fabe8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3181.0.0-linux-x64.tar.gz"
    sha256 "7b64b832d9450ae5d0593e32aca9599dc6501d56c66cff02a1da29e16fefb0e2"
  end
  version "3181.0.0"
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
