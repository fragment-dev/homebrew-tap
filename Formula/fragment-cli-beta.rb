require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3269.0.0-darwin-x64.tar.gz"
    sha256 "0b9869f02e0caa9f700fc391f78184df56aa2d89f5705a47e8324c89c6b93ab7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3269.0.0-darwin-arm64.tar.gz"
      sha256 "d8e2690af283477a3a82703f07007fa4d3eafd24b46d11d2290dae08b0cfdbb5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3269.0.0-linux-x64.tar.gz"
    sha256 "7d39dfef7074a2ef00b4c342621adf6b0509cb9442b957cfebd3b01d3c005bc8"
  end
  version "3269.0.0"
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
