require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6039.0.0-darwin-x64.tar.gz"
    sha256 "0b61c53a9b3fcf604a609a60747a35f37c9a49732898f6dc03e699cb83982519"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6039.0.0-darwin-arm64.tar.gz"
      sha256 "93262d4c8037ad843159c4f1950809695170096659cd3b90772f5e53093c2a51"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6039.0.0-linux-x64.tar.gz"
    sha256 "5ca87c9f8ad705adc47cef3b187bd48ed06c9767a25e13fdee1f9e74ac436f28"
  end
  version "6039.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
