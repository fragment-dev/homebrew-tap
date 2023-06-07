require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2815.0.0-darwin-x64.tar.gz"
    sha256 "d8e5e1129e31161d7a2586f3b8cdbad7c3958d5be93e95825914a01d93ffd5fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2815.0.0-darwin-arm64.tar.gz"
      sha256 "75a1bc2907118a2acccf25754c7a604fe04a5ea0c3a220ac096dc125eb09c5ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2815.0.0-linux-x64.tar.gz"
    sha256 "774a4fcbf5f53f6e51f09099affdb06b2f5eab3c3ab1362e9730480192e07057"
  end
  version "2815.0.0"
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
