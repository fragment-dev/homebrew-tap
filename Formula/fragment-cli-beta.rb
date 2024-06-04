require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5181.0.0-darwin-x64.tar.gz"
    sha256 "101d450f96ffc932095f47de0aba1dd719ce562580834e3c11e9c5b3777569aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5181.0.0-darwin-arm64.tar.gz"
      sha256 "5e29fdb4dac60c5f254bcd48e00be85f6fc3c8354019e8d406578e0bb9600264"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5181.0.0-linux-x64.tar.gz"
    sha256 "ba2f6a74eba601ef0d37944c9e0b74d166a2eda4e3fd6ec29a2f8984daddddfd"
  end
  version "5181.0.0"
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
