require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2657.0.0-darwin-x64.tar.gz"
    sha256 "d17a8374289f7e25728c210b4fe68465f8e06d5bb7c3168c7f7ca90f71d5a05f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2657.0.0-darwin-arm64.tar.gz"
      sha256 "a30df7c999ce39c14069ba0d09e1303d7cf89fa63a71fca66d1091f644eb52ad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2657.0.0-linux-x64.tar.gz"
    sha256 "92b40766fe91d11d7e53b47227fa0aa61c1684285ace507b9fca5ace69c68bf0"
  end
  version "2657.0.0"
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
