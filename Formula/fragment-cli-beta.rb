require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4974.0.0-darwin-x64.tar.gz"
    sha256 "2487e0a8b79ab8e182cc3e3e3121ee736a090c21b972528cd9ad43925653415f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4974.0.0-darwin-arm64.tar.gz"
      sha256 "a44aa571944b3c925ce2540e8d32930ba0e1764630442dccffd1991143b43b24"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4974.0.0-linux-x64.tar.gz"
    sha256 "ea7f6fa23da1f8d51b53bbc524dbb0e3bbb986db9d44968c667be908eb57b63b"
  end
  version "4974.0.0"
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
