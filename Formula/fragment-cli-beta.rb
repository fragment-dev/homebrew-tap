require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3494.0.0-darwin-x64.tar.gz"
    sha256 "3b056a5562e6e30e5d5a92b8c99f8c74ee97b30ec678f201749791c67445868f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3494.0.0-darwin-arm64.tar.gz"
      sha256 "29e92ecaca46ab805f6eba537725247f1d4e6c93ce61ca88f294ca9903b2fcd0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3494.0.0-linux-x64.tar.gz"
    sha256 "fd25caeee9e0d30d1c3ff315ffed6f41745a4f50938e71f62b8ecb72c6e564d2"
  end
  version "3494.0.0"
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
