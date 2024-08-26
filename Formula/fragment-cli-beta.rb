require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5539.0.0-darwin-x64.tar.gz"
    sha256 "99982ed94e74b54002097d9e8d789b1135586e2bc6bcf316bc740920f527f924"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5539.0.0-darwin-arm64.tar.gz"
      sha256 "2383c3c91efad5102a7b433a3ac53ea8a00f2c29f436e000f302ee66f6cc00df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5539.0.0-linux-x64.tar.gz"
    sha256 "0bf678e80b628242bb448051d092f8faabf19949ec6d03ac34816bddbd49a6ea"
  end
  version "5539.0.0"
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
