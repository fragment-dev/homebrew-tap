require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3756.0.0-darwin-x64.tar.gz"
    sha256 "8ef2da161b9ebf53f9e26811118f9a2376bd2c51d409660194846a14f00dfd15"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3756.0.0-darwin-arm64.tar.gz"
      sha256 "e84e4d3628cc430ca45e511dc0232388d28d983273273a60d5c25668ecfcf924"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3756.0.0-linux-x64.tar.gz"
    sha256 "2a197b863079e7fa3d9cf5d81123a22f1840dc7d38f14c71165115cfe74ce5f5"
  end
  version "3756.0.0"
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
