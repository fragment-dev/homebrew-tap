require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4316.0.0-darwin-x64.tar.gz"
    sha256 "ddf2ab06eefb048f9206da13a9402b21e96973952fe649363f508636ad9a19b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4316.0.0-darwin-arm64.tar.gz"
      sha256 "d0df90000958390a8edadac66a17d66b5e25ade3446c7987808c34910bd4ebdc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4316.0.0-linux-x64.tar.gz"
    sha256 "ed7c21b004018f49d7eb6247ebe43b75ed21cc1323d1c245ce0e17dad3a57905"
  end
  version "4316.0.0"
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
