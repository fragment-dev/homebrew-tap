require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3389.0.0-darwin-x64.tar.gz"
    sha256 "7d9f9dead56e5a57777d3d15e522e80ee69b85bed08aa7311793bb3f5d4e1f08"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3389.0.0-darwin-arm64.tar.gz"
      sha256 "fed762ab0e54c0af7cbaa0f4e0ed7a604b792afbbaf8587fd1b457a579b91005"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3389.0.0-linux-x64.tar.gz"
    sha256 "b4676a1bee2fc7cdfa104fbe0eac068761bb30e860b239000c341e6904d02b6f"
  end
  version "3389.0.0"
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
