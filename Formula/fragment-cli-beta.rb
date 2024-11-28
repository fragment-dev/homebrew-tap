require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5837.0.0-darwin-x64.tar.gz"
    sha256 "fbbbb61c1f8955e13532bcc17a1c4eba24e3cba422623b94a42a6c224bd99fc3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5837.0.0-darwin-arm64.tar.gz"
      sha256 "6ca4304389fdc634c59d8c0febb57581f7019d7159beb7e4d7669e8b5ef195f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5837.0.0-linux-x64.tar.gz"
    sha256 "ff77030b090e6bd387b977fbdb8f560b7737e8205680151c4f9601adc5ff8f9c"
  end
  version "5837.0.0"
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
