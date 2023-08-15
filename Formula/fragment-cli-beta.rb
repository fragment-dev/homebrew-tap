require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3320.0.0-darwin-x64.tar.gz"
    sha256 "2dc7f060b9556d07777ed092b3655585e117d00e9a347d5632504dd61627ef65"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3320.0.0-darwin-arm64.tar.gz"
      sha256 "a0ba642b514d245e5ada6b7519b853ef80b7f980608e2fb9979bf75561876dc4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3320.0.0-linux-x64.tar.gz"
    sha256 "8a5fd79054d140497962f74a4a49c11926fd73e3708bbd980c578d860cdf947f"
  end
  version "3320.0.0"
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
