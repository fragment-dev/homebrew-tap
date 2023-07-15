require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3076.0.0-darwin-x64.tar.gz"
    sha256 "1698e2df394ed480cc6b4fdb7992cbfd45c32c14d66dce5c12c1cb16fbd6a66c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3076.0.0-darwin-arm64.tar.gz"
      sha256 "b8cc081191c105ad1b8b709e4a7f4b9435c000807004b875f3b291e05f538476"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3076.0.0-linux-x64.tar.gz"
    sha256 "3ba9d8b5d89d8bca2cc613d472352bf0e62a815dbeadfff51a82fcce8c8cf2f0"
  end
  version "3076.0.0"
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
