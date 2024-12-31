require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6015.0.0-darwin-x64.tar.gz"
    sha256 "f3777c6a0cab56a637b85573f29ce4e7415cbc9ad178e3ab5e4d55952db3db32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6015.0.0-darwin-arm64.tar.gz"
      sha256 "41aea6cdd2b75ee7a47ab720c06be32293b547b2f8846b447fb264f80337dc76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6015.0.0-linux-x64.tar.gz"
    sha256 "3c7cb954f2b29aac775e2e43469597a4faf4e272dc40f3f3ad0e57d6f842bbb9"
  end
  version "6015.0.0"
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
