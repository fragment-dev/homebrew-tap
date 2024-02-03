require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4490.0.0-darwin-x64.tar.gz"
    sha256 "40e055d5c2dc2d979c9671ef6575dc9b1955a38f4226f8014f0186e080692bfb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4490.0.0-darwin-arm64.tar.gz"
      sha256 "bd0b5d03d74d38c6c364f3d70c9767fc4f862f36dedd5e277abf3b78e8c9fc37"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4490.0.0-linux-x64.tar.gz"
    sha256 "d1f2eda8b644fd077b915a1c4eadc8bb8d73b76d1c27ffc49a9c2de1e0ba351d"
  end
  version "4490.0.0"
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
