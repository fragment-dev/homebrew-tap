require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2911.0.0-darwin-x64.tar.gz"
    sha256 "52d9776b4f69fdd29fecf3135e92370b7eee512ee229e3f1085bff31b5242b6e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2911.0.0-darwin-arm64.tar.gz"
      sha256 "f84fc6b2278b8b169016beb146cc7175a12c27210a993956f276e643bda0d586"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2911.0.0-linux-x64.tar.gz"
    sha256 "f30f95baefb6c1260c63a75f33ff08ad0de97ac96089bab817b73ab76a687cde"
  end
  version "2911.0.0"
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
