require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5543.0.0-darwin-x64.tar.gz"
    sha256 "448eeeca698377841623a723ef85f92b1dcd0e04cd2142bb105b25d80abdd745"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5543.0.0-darwin-arm64.tar.gz"
      sha256 "e124a7c7d917b77a8c1414fe865e90268f831b74ede7787e6c77811d6104b80d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5543.0.0-linux-x64.tar.gz"
    sha256 "2f22cca991b7065d69fd86e5391c41b977becde1784b42053e37e794038fb9d5"
  end
  version "5543.0.0"
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
