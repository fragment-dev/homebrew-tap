require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4549.0.0-darwin-x64.tar.gz"
    sha256 "afcbf25775623b53b77e32a1457610aa53544c90fda3f3b77256d4c0ceca3491"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4549.0.0-darwin-arm64.tar.gz"
      sha256 "d9bbb03cd53b3ae2ba80e54022ef257221de7e3b948bda5ef69d0ce4325606f8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4549.0.0-linux-x64.tar.gz"
    sha256 "f68a130b3c4f9108cba485e7bfd18b85ff17699fbe1fdcd105fbfcc3c8b01168"
  end
  version "4549.0.0"
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
