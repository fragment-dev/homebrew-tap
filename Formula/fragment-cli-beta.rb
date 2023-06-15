require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2857.0.0-darwin-x64.tar.gz"
    sha256 "b443f12fa5ae523aaa028f32de6793052494bdbb9ba99a55756570a586ca771d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2857.0.0-darwin-arm64.tar.gz"
      sha256 "2e3177fa67d97cf905b14e268f9104fff450fd1d226f88bd977feba04c44ec9f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2857.0.0-linux-x64.tar.gz"
    sha256 "e80184f269f64cd383beeafa17292372b66426ad56aa923e8ed8bbf8d47dee2f"
  end
  version "2857.0.0"
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
