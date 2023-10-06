require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3778.0.0-darwin-x64.tar.gz"
    sha256 "fcf92695ab27dbd858ebbf2b4a49967f895a7ab73a825cad889818b24bf51564"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3778.0.0-darwin-arm64.tar.gz"
      sha256 "2335ee652aacff923b58e23be25cbd055f8d488d0ec0c44d789e3250ce77d420"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3778.0.0-linux-x64.tar.gz"
    sha256 "22eee78ad2e913a06beca0635eafb7dc0695dbdcbff69d2d357403d7ce94af17"
  end
  version "3778.0.0"
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
