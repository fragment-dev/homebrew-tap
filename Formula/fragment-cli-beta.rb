require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4107.0.0-darwin-x64.tar.gz"
    sha256 "dd11033b31f24c048dcd104801cbfff5dd9aa9dcc5b3aa48b0933b1b72fbbb78"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4107.0.0-darwin-arm64.tar.gz"
      sha256 "bc700b293815cf2e8365b07b251db7c3c071e6a6f11cffdb07ea103049f5e9e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4107.0.0-linux-x64.tar.gz"
    sha256 "9d85913d79cd8cd27ae856fd796c2a28a145608acb5ebc23bcb12fc7b6a2903f"
  end
  version "4107.0.0"
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
