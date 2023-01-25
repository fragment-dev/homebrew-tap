require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1838.0.0-darwin-arm64.tar.gz"
    sha256 "a56eef99beefc9d06928355e7ea763b6772ff3aa14e0acbc6e5998374d17aa62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1838.0.0-darwin-arm64.tar.gz"
      sha256 "2955204fa56052c4bd4fbef118dbe81fee0d4b4847cdb23acd5384c5fe1717e8"
    end
  end
  version "1838.0.0"
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
