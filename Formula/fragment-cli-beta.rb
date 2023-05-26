require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2749.0.0-darwin-x64.tar.gz"
    sha256 "81c7df26db467fa8cada73cfef8551de31b0c7d4810ba21f8e3c759f9a817c24"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2749.0.0-darwin-arm64.tar.gz"
      sha256 "27908c4c36f3557a9ede0447465a0cfa24796edc82ff9af98c5aad5aae0b1dfc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2749.0.0-linux-x64.tar.gz"
    sha256 "7e1ee910962b5d0469148a35f7b6b57b0ac34195e518013991a343b2ad61e3ab"
  end
  version "2749.0.0"
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
