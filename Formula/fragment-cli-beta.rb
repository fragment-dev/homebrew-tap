require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5836.0.0-darwin-x64.tar.gz"
    sha256 "4ab92b8962e1de949a2ec330cfd30343d8213689998b3a47ed3d42f45ab08225"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5836.0.0-darwin-arm64.tar.gz"
      sha256 "0cd0c45eb3b7d52582c3cdda1b924737955b03649e9ad409b92c6f304be8a09b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5836.0.0-linux-x64.tar.gz"
    sha256 "d271d070db15c4962ffd169cf3a2cd905538493b6fbc1cf885cd6a85e028f3c0"
  end
  version "5836.0.0"
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
