require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3190.0.0-darwin-x64.tar.gz"
    sha256 "97bb3d8726c894232165a898d4ba3e6faa42f5ef8b01b68d533777c50120d31d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3190.0.0-darwin-arm64.tar.gz"
      sha256 "dc8a4248ca776fff0fefd659dbfefd1c35aae00df6f27927cd8a1ea71d452836"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3190.0.0-linux-x64.tar.gz"
    sha256 "0a41b1fb11fee17973d4493fb9fb3ea6f6e446b82dffe55bd4cba598d2c08e49"
  end
  version "3190.0.0"
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
