require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4198.0.0-darwin-x64.tar.gz"
    sha256 "66e6ff4a558b95c077ccdef28cf2a58e6e442de857afc364a61fe0009eac7471"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4198.0.0-darwin-arm64.tar.gz"
      sha256 "c5d778bcfa53f321f4870a40bba409946327c93d65f83a5f8ab371bc49aef642"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4198.0.0-linux-x64.tar.gz"
    sha256 "796e045b242aad53477f65c0806e2d70ef6466c0d511274544157f49ed61ad32"
  end
  version "4198.0.0"
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
