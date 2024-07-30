require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5451.0.0-darwin-x64.tar.gz"
    sha256 "f38737102c711d053beb3b16d1b4cddcc935af1bff3405e8e9063327998522ec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5451.0.0-darwin-arm64.tar.gz"
      sha256 "7b31ba0890933a81a601000218c681c67af77d7534015b0be4aa09c51807c020"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5451.0.0-linux-x64.tar.gz"
    sha256 "a5338b2479aca905883733d3e2b91cefbfad4551b6ca17f38f12622ca9fd114b"
  end
  version "5451.0.0"
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
