require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4400.0.0-darwin-x64.tar.gz"
    sha256 "5893e16c7a6afafff0c62f82d626bada3cd10f11de258a9b6c46feecfb018f46"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4400.0.0-darwin-arm64.tar.gz"
      sha256 "8682914864a50164c44743721df988066e47ed3b97764f977a836b96279fef6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4400.0.0-linux-x64.tar.gz"
    sha256 "5da8cb75dee402360cb0f16a92e877f53a22de22c8746105e98113a75ece170f"
  end
  version "4400.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
