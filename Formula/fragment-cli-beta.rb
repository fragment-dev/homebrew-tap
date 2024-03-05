require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4715.0.0-darwin-x64.tar.gz"
    sha256 "8756a0ecb6cc638cb778d8312dc9f4de5211a0186ad995ddf261f413831c1d68"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4715.0.0-darwin-arm64.tar.gz"
      sha256 "74c9e4cec31c6714840440ccb9e92f8f06bc9576dc48301a2d119ebea7eb0ee0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4715.0.0-linux-x64.tar.gz"
    sha256 "d99e80116400acc7a7ce91c93aa514972d34b1283982178db624f36a405e810e"
  end
  version "4715.0.0"
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
