require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2222.0.0-darwin-x64.tar.gz"
    sha256 "e181423942b7c227c6e8abb834c9d834a4709ba948fb41f9d0e7500806c1296f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2222.0.0-darwin-arm64.tar.gz"
      sha256 "9cda1a9097e4a2657c29735275950f1de9a45a966ac71db8b2820efacf0ea2a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2222.0.0-linux-x64.tar.gz"
    sha256 "3fb905495fb9f5d9dc0fe29a1cf7892caeb92982a36a78ebd47f142f28ee2f8b"
  end
  version "2222.0.0"
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
