require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3954.0.0-darwin-x64.tar.gz"
    sha256 "4b85eda2c9c0ab172194146fb05ad533133f9b923309528ea0c3f2ee9e36b9a4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3954.0.0-darwin-arm64.tar.gz"
      sha256 "76839103b76abb4e28b9e91e85b53de38f39ffa00b0c0aa03067d0cfdfde48d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3954.0.0-linux-x64.tar.gz"
    sha256 "1354e6e72ec21ac3117681735ca95bac93789ba401fb6fe9ed16992186fe9b9e"
  end
  version "3954.0.0"
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
