require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3413.0.0-darwin-x64.tar.gz"
    sha256 "5260b650a968901a7c9d38346206f1b393dadbb73e18073f7ee88f82e4e72975"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3413.0.0-darwin-arm64.tar.gz"
      sha256 "091a6cc726c123a1a7a41f9b0f2e31ee072d231dc33f0aeac8c953e07085e5c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3413.0.0-linux-x64.tar.gz"
    sha256 "4177e66695593d289ecd8246ca7574a923a6c18b4b51ccec8b4bffd197b31890"
  end
  version "3413.0.0"
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
