require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3638.0.0-darwin-x64.tar.gz"
    sha256 "5d36a0dfee5a08cd81de77646e64c0998bd3c84226156c8afcdea05b0f39ab3b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3638.0.0-darwin-arm64.tar.gz"
      sha256 "a5a0b3c3900c506775c2cb5f26a0048f21efeadeb4ca6694d68c23e0e7f16b7d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3638.0.0-linux-x64.tar.gz"
    sha256 "1154857bf5da2d04d26583084be652f73b610d281d384a75aa9e18fec8394112"
  end
  version "3638.0.0"
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
