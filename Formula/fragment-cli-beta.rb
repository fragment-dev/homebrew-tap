require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2986.0.0-darwin-x64.tar.gz"
    sha256 "2420fe8f3787adb4890ff225b0d7470c4eb36e3b43165af10fa3b062d9f93b1b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2986.0.0-darwin-arm64.tar.gz"
      sha256 "ad0294828db63b83569653811c6379025eb2dff073b2eebd28b6786df3a7f336"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2986.0.0-linux-x64.tar.gz"
    sha256 "f45d1863fc8b9b0cd75cca0eca33272e60f5c88708d399a1272438d9f367dde9"
  end
  version "2986.0.0"
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
