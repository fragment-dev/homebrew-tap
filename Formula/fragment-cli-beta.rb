require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4020.0.0-darwin-x64.tar.gz"
    sha256 "ea79b0965a5b0b300caafc37f4c3a8a824c11b642a35941a4f742d1a2caec3c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4020.0.0-darwin-arm64.tar.gz"
      sha256 "4dd7459abb13595b7ae313643a197b01d5164f8353647b3252c40f4872a0b07d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4020.0.0-linux-x64.tar.gz"
    sha256 "8d870834ee9ae7582f741a1a996a803a7b6a7580b45462bdb8fe1eba96cac6de"
  end
  version "4020.0.0"
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
