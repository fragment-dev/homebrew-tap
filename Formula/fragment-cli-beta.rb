require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3235.0.0-darwin-x64.tar.gz"
    sha256 "acab57c3bf87f38808f7cef30fc31ef62be1cb8b0984cd276746a16ff13c2ea4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3235.0.0-darwin-arm64.tar.gz"
      sha256 "78e48cc677892b51bb12e7c7337ad496e5e288c69792ed03128e1b7bf88d1b53"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3235.0.0-linux-x64.tar.gz"
    sha256 "c6e990f8eb4091b047d293cc8d1642e0817ea1149ef0d7f2efac2a3ab0e8d285"
  end
  version "3235.0.0"
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
