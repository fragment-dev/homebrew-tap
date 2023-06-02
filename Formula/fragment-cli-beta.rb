require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2782.0.0-darwin-x64.tar.gz"
    sha256 "9a13a051fbcc4a570a2187420a5cc5dcb04d3a7541eeac9981af09e48a256378"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2782.0.0-darwin-arm64.tar.gz"
      sha256 "5389746f9c6f250ca2da917ffac3507e80d5785cb7afa53c7bfa55938f8abcff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2782.0.0-linux-x64.tar.gz"
    sha256 "8805cb1f70ad9c7c9613f66674038a50ba5d773f20b0714f4b566086593e4f8e"
  end
  version "2782.0.0"
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
