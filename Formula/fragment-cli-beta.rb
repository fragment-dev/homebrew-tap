require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4885.0.0-darwin-x64.tar.gz"
    sha256 "2efd40942bd3e4ed4dc6e089c68e4f7fe16d253772e0a1cf0cd9b47251eba14d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4885.0.0-darwin-arm64.tar.gz"
      sha256 "b17d696692b1ef16e67be5204d080742488c737a5e751a07b1f6274fc88f3856"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4885.0.0-linux-x64.tar.gz"
    sha256 "7f8e9a6bef0a1d67d775c606fdc7a3f04c424ce000f57ee5c111bedd1613a85c"
  end
  version "4885.0.0"
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
