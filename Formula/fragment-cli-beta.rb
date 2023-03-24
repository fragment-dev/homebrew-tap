require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2274.0.0-darwin-x64.tar.gz"
    sha256 "9081a5c87dc6919279fe68b18850d7338f942014b0ec5a4070fdee88356e87c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2274.0.0-darwin-arm64.tar.gz"
      sha256 "7ce79b80697be7e256f0f710624d76e2edc17f2e21668ac41f8bcb428f55a049"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2274.0.0-linux-x64.tar.gz"
    sha256 "6bc3cf01d12a0d6358e957ffaf16f8b3db37a9d95f3e4108c5e6f99cb0ed9426"
  end
  version "2274.0.0"
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
