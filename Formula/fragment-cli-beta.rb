require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5807.0.0-darwin-x64.tar.gz"
    sha256 "487eb6a79d811ae13e81ec118cefd5b0f62d3c0b902025a4d2d5232a0cc652fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5807.0.0-darwin-arm64.tar.gz"
      sha256 "5e17ae661341afb81d74caaed1a0526acbc6abef36973f5a2473d0b496407601"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5807.0.0-linux-x64.tar.gz"
    sha256 "50d4f8418b7b9031e25254584642a5c5d07337c15476bdc292cd46bf61a31cb1"
  end
  version "5807.0.0"
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
