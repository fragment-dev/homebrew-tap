require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4087.0.0-darwin-x64.tar.gz"
    sha256 "311f2d5a81bbfe692bc2f10a39d46df992e4852f8279ddb2803d26364b9a6826"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4087.0.0-darwin-arm64.tar.gz"
      sha256 "ec07b4fd519adcc1a96746e8e6486e819103077b279ac6d152a8707e5db648e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4087.0.0-linux-x64.tar.gz"
    sha256 "381896e46807654a1f360fd72f737fb2c774fe7c65cf3076d894bbf769681f42"
  end
  version "4087.0.0"
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
