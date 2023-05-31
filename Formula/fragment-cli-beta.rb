require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2769.0.0-darwin-x64.tar.gz"
    sha256 "1eeda1eb0d5953807cc7bbf3d832ecf1877f78f32ffa855a991d6e615e3b6452"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2769.0.0-darwin-arm64.tar.gz"
      sha256 "d5f1804e9479ec443b043de64b5842d28af3be3a7d1def26d46cac3649208655"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2769.0.0-linux-x64.tar.gz"
    sha256 "475d729561f70004f0ae9ecb00fc903e905002cec5d6a3b16cd35a7038b257d2"
  end
  version "2769.0.0"
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
