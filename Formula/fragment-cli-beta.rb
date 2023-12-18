require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4162.0.0-darwin-x64.tar.gz"
    sha256 "084828c364bc72510e72734b61ad681a1fc877df60aa90acb0e6e0ad305e6905"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4162.0.0-darwin-arm64.tar.gz"
      sha256 "189419c38359d6691992502f365eb46e69c8833da7aecc5d634ea02fa3f07577"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4162.0.0-linux-x64.tar.gz"
    sha256 "d6d7b93bd4c64c01d2dd88326f1e8f4162c49ea9b2f532def44ccd99a1815247"
  end
  version "4162.0.0"
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
