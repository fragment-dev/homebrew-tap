require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5258.0.0-darwin-x64.tar.gz"
    sha256 "6bd4a53faa1089849f234d1159027ded0f739d975474792d69c09ca52f7a4d47"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5258.0.0-darwin-arm64.tar.gz"
      sha256 "b576541d4b294bad78eff04ab869bdb90ac2da0760989e013c18f18b7f223b29"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5258.0.0-linux-x64.tar.gz"
    sha256 "b8ce7fec2dbfe85fd0b6040ae6492e2d50d6a4a8d3571d5b17f95c280f1a6b76"
  end
  version "5258.0.0"
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
