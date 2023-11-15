require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4014.0.0-darwin-x64.tar.gz"
    sha256 "8afdb1ee5586a29b7518af0655b6a4a5da667ccb8fcba1d5a551e911decf406b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4014.0.0-darwin-arm64.tar.gz"
      sha256 "deead40c2cf976b02cbf031dfa74c45ed713fe24a56dd3c83c87def4424fb0b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4014.0.0-linux-x64.tar.gz"
    sha256 "aa63fe1dd60a3e1e0e9bf53dd719152a6b4a59ef832c3777d3d554735a1db1e3"
  end
  version "4014.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
