require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2896.0.0-darwin-x64.tar.gz"
    sha256 "d4e03138e433f32a8ea18c8de87c28d866aa44ebe7d02dfea1bf8fb67aa25886"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2896.0.0-darwin-arm64.tar.gz"
      sha256 "ecae895ffc8662eba1c9b0d1d0c4269ba2b45994c8d15fc17c9aa183f43639e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2896.0.0-linux-x64.tar.gz"
    sha256 "ce5df054a49aad0b38666e98757bb295176f86de3b63fb327e0943d7aaeb1e17"
  end
  version "2896.0.0"
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
