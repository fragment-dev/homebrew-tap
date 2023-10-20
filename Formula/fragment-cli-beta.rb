require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3873.0.0-darwin-x64.tar.gz"
    sha256 "6fcd84a672f568bb72b76381538bb5a3f99953d4f03ac62de0125e52e9a09206"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3873.0.0-darwin-arm64.tar.gz"
      sha256 "fd23ecffe368093a36eb8a57d78db2201717c4d69436e6e705727fd350046dcd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3873.0.0-linux-x64.tar.gz"
    sha256 "47630d8cb34b79e0745dcc48e3ffb9f7daddd14d3dc08c7bfdb37cec2dee284a"
  end
  version "3873.0.0"
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
