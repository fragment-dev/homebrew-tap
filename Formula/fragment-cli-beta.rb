require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3169.0.0-darwin-x64.tar.gz"
    sha256 "875e3bd6a1900d7275207730949ebb64c2ebf123d39f624353b08ec40c8720a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3169.0.0-darwin-arm64.tar.gz"
      sha256 "9ee9432807e3133b69b20df50f737e6cb2de10e9fd406ed0af8b69b4e36e9696"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3169.0.0-linux-x64.tar.gz"
    sha256 "bdaed63c19ac0919806ce31fd52dfb21ccdd12b168b2f0695aeb1b5197d4ce67"
  end
  version "3169.0.0"
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
