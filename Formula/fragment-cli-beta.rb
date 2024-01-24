require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4421.0.0-darwin-x64.tar.gz"
    sha256 "321960212c1c5299d5c95d5432fb5978b19e024f200e450f10a50509a0f8b0db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4421.0.0-darwin-arm64.tar.gz"
      sha256 "23c5ae36c1f356495882660e868209ebd93cb304e1bb3bbd85fa44bdd28ecc56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4421.0.0-linux-x64.tar.gz"
    sha256 "907fa1fe269e9f47041c99620c853d8069f4549c4b6313b4242bb5df44c87891"
  end
  version "4421.0.0"
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
