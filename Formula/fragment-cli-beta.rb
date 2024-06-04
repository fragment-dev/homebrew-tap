require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5187.0.0-darwin-x64.tar.gz"
    sha256 "5bcd6dd8cae9afee57c2e32c9510293e60a9de4dbcf7a9a2b37bab4812d2d5da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5187.0.0-darwin-arm64.tar.gz"
      sha256 "36275c43e3c1acf64afa70955ccd0cac8df47c4fc4a059a201487b6bbd4689e4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5187.0.0-linux-x64.tar.gz"
    sha256 "8b0769cca527109289d34c82e05a365f8d1b4cf6ce70271d6bec10b166bd60a1"
  end
  version "5187.0.0"
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
