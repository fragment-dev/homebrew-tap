require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2392.0.0-darwin-x64.tar.gz"
    sha256 "a5f078e8d9ea6b1c86fbfc0b1755eda252cc9faaa19b84e5367ead856b42b5b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2392.0.0-darwin-arm64.tar.gz"
      sha256 "d743ec73805426cbe45143727e7f675a8cc35a07e71bf5e7d1ebc94d03fc1fcc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2392.0.0-linux-x64.tar.gz"
    sha256 "397e3af5b287ea545c134366e1f2b6012e580f30d1cc0b395534d4e8a5571fa9"
  end
  version "2392.0.0"
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
