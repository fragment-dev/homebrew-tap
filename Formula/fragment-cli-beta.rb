require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3411.0.0-darwin-x64.tar.gz"
    sha256 "26f5285b1de21427b26bf6e48d5ef88f3566d542669dca776266930f2aa9e038"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3411.0.0-darwin-arm64.tar.gz"
      sha256 "854f13a5f74e7c349faac5164dde54bcb7152e83ceaa1b7a6babe7b18b012676"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3411.0.0-linux-x64.tar.gz"
    sha256 "31dc21819442047f377095afe23b274a0f6177888114cc8ba90eb698b1d96891"
  end
  version "3411.0.0"
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
