require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4186.0.0-darwin-x64.tar.gz"
    sha256 "fbca0a3fc0dccb020766dab10f15781fdd312b14d72176f16d297e2cd00e3723"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4186.0.0-darwin-arm64.tar.gz"
      sha256 "399caf14907681161df621bcde952af935c34e7885a07abfc6b995caf509ec8a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4186.0.0-linux-x64.tar.gz"
    sha256 "0134f17ba097652234d2d83f75eca68c0cd80dc3184273507191c62c1f47e718"
  end
  version "4186.0.0"
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
