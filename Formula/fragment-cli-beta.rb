require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4738.0.0-darwin-x64.tar.gz"
    sha256 "a5c2fe2253a819c856f42688eba754efccb0c0d3abd449456e19b36c36b62ded"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4738.0.0-darwin-arm64.tar.gz"
      sha256 "775a20fe17b9b2ae88a5e02b4c15431f6bf89c28ebc7587ca6b2241e3c0201d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4738.0.0-linux-x64.tar.gz"
    sha256 "32aa4cf4a386c026c72f41fde5a46cc7273f568117e7c6f23e3d66e485b6b72f"
  end
  version "4738.0.0"
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
