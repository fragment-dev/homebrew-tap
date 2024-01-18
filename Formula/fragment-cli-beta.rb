require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4371.0.0-darwin-x64.tar.gz"
    sha256 "cb601776f7d59434c2e2fb1d975c625c24a4e7b277abcec72024d6701d4137f9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4371.0.0-darwin-arm64.tar.gz"
      sha256 "69e6932e94c2ecfcbe5266bfcbed521a5e32a7ce35ae11b537fc1ef921f73bfe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4371.0.0-linux-x64.tar.gz"
    sha256 "dffd5fc35553d57b52961f1cac63413c17bb1d70482041e4625cf1d88f8b9523"
  end
  version "4371.0.0"
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
