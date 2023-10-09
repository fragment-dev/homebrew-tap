require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3787.0.0-darwin-x64.tar.gz"
    sha256 "9117931c17a69f96a95f446cea0c9868193d27cd75a74a16e0b4dd45f5abb1ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3787.0.0-darwin-arm64.tar.gz"
      sha256 "c48e411aa0a1db692c8406f0fd30689f016d0ce3ac8accc5c98f614bb0f35e3b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3787.0.0-linux-x64.tar.gz"
    sha256 "db289cfd5a819eeb69d0c1aa59b7961cc1a86d77c488359fa376ecf13acde0f1"
  end
  version "3787.0.0"
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
