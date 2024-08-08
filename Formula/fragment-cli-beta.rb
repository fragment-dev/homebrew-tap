require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5485.0.0-darwin-x64.tar.gz"
    sha256 "337afbd44ca951cd8cc60a8572a8687eb2cdca2fdbe57613f402b899948829c7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5485.0.0-darwin-arm64.tar.gz"
      sha256 "a79cdbdf6f5662b355b2ebf627eddaa175ae02c34899cee7ca7234385f548dbc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5485.0.0-linux-x64.tar.gz"
    sha256 "8138495e18635fcda1e08fcf551121ef5818c8b941f747bca577414fda7e59e6"
  end
  version "5485.0.0"
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
