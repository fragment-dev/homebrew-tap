require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5251.0.0-darwin-x64.tar.gz"
    sha256 "f067bd219d2d8865d565448eb18f608bcf633e91189dc878b37af29a8f24a1d6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5251.0.0-darwin-arm64.tar.gz"
      sha256 "d612e8e83973b6839962d81aabad10b056aea2220d1fa8806a14a1a4258315b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5251.0.0-linux-x64.tar.gz"
    sha256 "54090addb14f424656b4cc71e024c23a6f85fc1b52a091a15493b3d9d205ecbf"
  end
  version "5251.0.0"
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
