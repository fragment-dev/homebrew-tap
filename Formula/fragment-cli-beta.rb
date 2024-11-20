require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5803.0.0-darwin-x64.tar.gz"
    sha256 "d07af481329d7c14b4dac55f1d7e97526e5d4d142d262f80df379f9077a67e34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5803.0.0-darwin-arm64.tar.gz"
      sha256 "35f5155aec5aa517acb018ca3601bddf1d9e70726411cde573bb3605c2bd2584"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5803.0.0-linux-x64.tar.gz"
    sha256 "1f65016524eb9b9252db5c66be3ddb6abc61609153b00112faae024eaeae786f"
  end
  version "5803.0.0"
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
