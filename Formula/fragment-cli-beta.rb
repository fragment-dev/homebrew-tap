require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3040.0.0-darwin-x64.tar.gz"
    sha256 "02dffd6ee0524105c640d4a36444bd84d4ba30ae875422f490fce7bfdfe9108b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3040.0.0-darwin-arm64.tar.gz"
      sha256 "1f278af7b22ecefed25f751abd17cbca54717cca7e145f2ab9cabef03fb5143e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3040.0.0-linux-x64.tar.gz"
    sha256 "8878b0ea893e34ed01a035a793425025b1e480fdf5fae687ef7967b3a18c4fa4"
  end
  version "3040.0.0"
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
