require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2457.0.0-darwin-x64.tar.gz"
    sha256 "53802731120aa61f090814ba6f8fda603e1a4f2196324ac4ccb06c1da527192c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2457.0.0-darwin-arm64.tar.gz"
      sha256 "187623376db1da8917ecd7c5a9b9576ea64f285cef3d7a62fc07cda3b58f5ded"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2457.0.0-linux-x64.tar.gz"
    sha256 "5898ea1b417d8ef7c42e0ba420a1ff7f82e82f61490b4dce52bd98d3f903673f"
  end
  version "2457.0.0"
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
